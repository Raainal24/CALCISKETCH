# CALCISKETCH_V3.0


## Overview

CalciSketch is an AI-powered smart whiteboard application that transforms handwritten mathematics into step-by-step digital solutions. Built using Python with Tkinter and CustomTkinter, the project combines an interactive drawing canvas with computer vision and language models to create a seamless learning experience.

Users can write equations naturally using a mouse, stylus, touchscreen, or smartboard. The application captures the written expression, recognizes the handwritten math using OCR through OpenRouter vision models, then solves the equation using an Ollama-hosted Mistral model running on a remote HPC server accessed securely through SSH. The complete solution is displayed directly inside the application.

CalciSketch was designed to make mathematics more intuitive, visual, and interactive for students, teachers, and self-learners.

---

## Problem Statement

Most traditional calculators only provide final answers. Many educational tools also require users to type equations manually, which interrupts natural problem solving.

This creates challenges such as:

* Slower input for handwritten learners
* Limited understanding of solving steps
* Poor classroom whiteboard integration
* Multiple tools needed for writing and solving
* Reduced engagement during learning

CalciSketch solves these problems by combining handwriting freedom with AI-based recognition and guided solutions.

---

## Core Concept

**Draw naturally → Detect intelligently → Solve step-by-step → Learn visually**

Instead of typing formulas, users simply write mathematics on a digital board. The system understands the handwritten input, computes the solution, and explains the logic in a readable format.

---

## Key Features

## Interactive Whiteboard

* Large digital canvas for handwritten input
* Smooth freehand drawing experience
* Brush and eraser tools
* Multiple color selection buttons
* Adjustable brush thickness slider
* Clear canvas instantly

## AI Handwriting Recognition

* Captures the canvas as an image
* Uses OpenRouter vision/OCR models to read handwritten equations
* Converts writing into standard mathematical notation
* Supports natural handwritten expressions

## Step-by-Step AI Solver

* Uses Ollama Mistral model deployed on a remote HPC server for solving
* Generates line-by-line mathematical steps
* Displays only relevant math operations
* Shows final answer separately on the canvas

## Save & Load Sessions

* Save whiteboard drawings locally using `.pkl` files
* Reload previous sessions anytime
* Useful for revision and teaching continuity

## Modern Multi-Page UI

* Home page with project branding
* About page with creator profiles and LinkedIn links
* Dedicated drawing workspace
* Asset-based polished controls and visuals

---

## How It Works

1. User opens the drawing workspace.
2. Writes a mathematical expression on the canvas.
3. Canvas is captured as an image using screen grab.
4. OpenRouter OCR model extracts the handwritten equation.
5. Parsed expression is securely sent to an Ollama Mistral instance running on a remote HPC server via SSH-enabled connectivity.
6. AI returns step-by-step mathematical solving steps.
7. Steps appear in a scrollable solution box.
8. Final answer is written directly onto the whiteboard.

---

## Technologies Used

## Frontend / UI

* Python
* Tkinter
* CustomTkinter

## Image Processing

* Pillow (PIL)
* ImageGrab for canvas capture
* Base64 encoding for API image transfer

## Artificial Intelligence

* OpenRouter Vision Models for OCR
* Ollama Runtime on Remote HPC Infrastructure
* Mistral LLM for reasoning and solving on HPC compute resources

## Backend Utilities

* Requests library for API communication
* Pickle for local file storage
* Tempfile for temporary image processing

---

## Architecture Flow

```text
Canvas Input
   ↓
Canvas Screenshot
   ↓
OpenRouter OCR Model
   ↓
Recognized Math Expression
   ↓
Remote HPC Ollama Mistral Solver
   ↓
Step-by-Step Output + Final Answer
```

---

## Real-World Use Cases

## Students

* Solve homework interactively
* Understand methods instead of memorizing answers
* Practice handwritten math digitally

## Teachers

* Use during live classroom teaching
* Smartboard-ready explanation tool
* Save solved examples for later classes

## Tutors

* Faster doubt solving sessions
* Better visual explanations
* Interactive online teaching support

## Self Learners

* Learn mathematics independently
* Receive guided solving instantly

---

## What Makes This Project Unique

* Combines whiteboard + OCR + local LLM in one application
* Natural handwritten input instead of keyboard-only math entry
* Step-by-step reasoning rather than answer-only tools
* Uses scalable remote inference through Ollama on HPC infrastructure
* Useful for smart classrooms and touch devices

---

## Future Enhancements

* Undo / Redo support
* Better OCR accuracy for complex handwriting
* Algebra and calculus expansion
* Graph plotting support
* Export as PDF / Image
* Multi-user collaboration
* Voice explanation mode
* Cloud sync and accounts
* Android / Tablet version

---

## Project Structure

```text
CalciSketch/
├── main.py                 # Main application source code
├── Assets/                 # Buttons, icons, backgrounds, cards
├── Saved Files/            # User saved sessions
└── README.md
```

---

## Team Contribution

CalciSketch was built as a collaborative project combining:

* Backend logic and application workflow
* AI model integration with remote HPC deployment
* OCR pipeline design
* User interface implementation
* Educational usability design

---

## Conclusion

CalciSketch demonstrates how AI can improve the learning experience when integrated into familiar tools like a whiteboard. By allowing users to write naturally and receive intelligent solutions instantly, the project creates a modern and practical educational assistant.

