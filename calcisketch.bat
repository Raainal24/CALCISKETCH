@echo off
title CalciSketch Launcher
color 0A

echo.
echo ==========================================
echo        CalciSketch Auto Launcher
echo ==========================================
echo.

REM ── STEP 1: SSH Tunnel + Start Ollama in ONE connection ──
echo [1/3] Connecting to HPC and starting Ollama...
start "HPC - DO NOT CLOSE" plink -ssh ^
    -pw amalnair ^
    -P 2224 ^
    -L 11450:localhost:11450 ^
    -L 8000:localhost:8000 ^
    amalnair@202.149.199.26 ^
    "cd bin && OLLAMA_HOST=0.0.0.0:11450 ./ollama-linux-amd64 serve"

echo Waiting for Ollama to fully load...
timeout /t 15 /nobreak >nul

REM ── STEP 2: Launch CalciSketch ──
echo [2/3] Checking connection...
curl -s http://localhost:11450 >nul 2>&1
if %errorlevel% neq 0 (
    echo WARNING: Ollama may still be loading, launching anyway...
)

echo [3/3] Launching CalciSketch...
echo.
cd /d "%~dp0"
python "New_Calcisketch.py"

echo.
echo CalciSketch closed.
pause