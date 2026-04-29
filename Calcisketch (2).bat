@echo off
title CalciSketch Launcher
color 0A

echo.
echo ==========================================
echo        CalciSketch Auto Launcher
echo ==========================================
echo.

REM ── CHECK PYTHON ──
echo Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH.
    echo Please install Python from https://www.python.org/downloads/
    echo Make sure to check "Add Python to PATH" during installation.
    pause
    exit /b 1
)
echo Python found.

REM ── CHECK AND INSTALL PIP DEPENDENCIES ──
echo.
echo Checking and installing required Python packages...
pip install customtkinter >nul 2>&1
pip install pillow >nul 2>&1
pip install ollama >nul 2>&1
pip install requests >nul 2>&1
echo Python packages ready.

REM ── CHECK AND INSTALL PUTTY/PLINK ──
echo.
echo Checking for plink...
plink --version >nul 2>&1
if %errorlevel% neq 0 (
    echo plink not found. Installing PuTTY via winget...
    winget install --id PuTTY.PuTTY -e --silent
    if %errorlevel% neq 0 (
        echo.
        echo winget failed. Downloading plink manually...
        curl -L -o "%TEMP%\plink.exe" "https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe"
        if exist "%TEMP%\plink.exe" (
            copy "%TEMP%\plink.exe" "C:\Windows\System32\plink.exe" >nul 2>&1
            echo plink installed successfully.
        ) else (
            echo ERROR: Could not install plink automatically.
            echo Please download PuTTY manually from:
            echo https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
            echo And place plink.exe in C:\Windows\System32\
            pause
            exit /b 1
        )
    ) else (
        echo PuTTY installed successfully via winget.
    )
) else (
    echo plink found.
)

REM ── ACCEPT HOST KEY ON FIRST RUN ──
echo.
echo Accepting SSH host key (first time setup)...
echo y | plink -ssh -pw amalnair -P 2224 amalnair@202.149.199.26 "echo connected" >nul 2>&1
echo Host key accepted.

REM ── STEP 1: SSH Tunnel + Start Ollama in ONE connection ──
echo.
echo [1/3] Connecting to HPC and starting Ollama...
start "HPC - DO NOT CLOSE" plink -ssh ^
    -pw amalnair ^
    -P 2224 ^
    -L 11450:localhost:11450 ^
    -L 8000:localhost:8000 ^
    amalnair@202.149.199.26 ^
    "OLLAMA_HOST=0.0.0.0:11450 /home/amalnair/bin/ollama-linux-amd64 serve"

echo Waiting for Ollama to fully load...
timeout /t 15 /nobreak >nul

REM ── STEP 2: Check connection ──
echo [2/3] Checking connection...
curl -s http://localhost:11450 >nul 2>&1
if %errorlevel% neq 0 (
    echo WARNING: Ollama may still be loading, launching anyway...
)

REM ── STEP 3: Launch CalciSketch ──
echo [3/3] Launching CalciSketch...
echo.
cd /d "%~dp0"
python "New_Calcisketch.py"

echo.
echo CalciSketch closed.
pause