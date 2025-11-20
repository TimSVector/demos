# VectorCAST Demo Projects

This repository contains **demo environments for [VectorCAST](https://www.vector.com/us/en/products/products-a-z/software/vectorcast)**, organized by target architecture and compiler toolchain.  
These demos serve as reference implementations for evaluating VectorCAST on common embedded platforms.

Each top-level directory represents a specific chip family (e.g., Cortex-M7F), and each target contains subdirectories for individual compilers (GCC, IAR, etc.).

---

## 📁 Repository Structure

```
/
├─ Cortex-M7F/
│  ├─ GCC/            # Demo setup using GCC ARM Embedded toolchain
│  ├─ IAR/            # Demo setup using IAR Embedded Workbench
│  └─ ...             # Other compilers as needed
└─ ...                # Future targets
```

Each compiler directory includes:

- Toolchain/build configuration  
- VectorCAST environment files  
- Demo project/workspace  
- Scripts for launching, building, and executing tests  

---

## 🚀 Getting Started

### 1. Configure Your Environment

Before running any demo, edit the following file:

```
setenv.bat
```

This file would be located in the **_[chip]/[compiler]_** directory (eg., Cortex-M7F/IAR/setenv.bat)

Update the variables inside to match the locations of **your installed toolchains**, such as:

- GCC (Arm GNU Toolchain / ARM Embedded GCC)  
- IAR EWARM  
- Any vendor-specific compilers  
- Optional debugger/simulator paths  

This ensures all build and execution scripts can locate the required tools.

---

### 2. Start VectorCAST

Once `setenv.bat` is configured, launch VectorCAST using:

```
start_vc.bat
```

This script:

- Loads your environment variables  
- Prepares the compiler paths  
- Opens a configured VectorCAST session  

---

### 3. Build & Execute the Demo

Inside the VectorCAST environment:

1. Select the target and compiler demo you want to run  
2. Build the project using VectorCAST’s build integration  
3. Execute the test suite (unit tests, coverage tests, etc.)  
4. Review generated results, logs, and coverage reports  

Each compiler folder contains the project-specific configuration for that toolchain and demo target.

---

## ✔ Notes

- These demos are intended as **starting points** for users learning VectorCAST or validating toolchain integrations.  
- Additional chip families and compilers will be added over time.  
- Toolchain installations are **not included**; users must supply their own supported compilers.  
- All demos are structured to make it easy to add new targets or toolchains following the same pattern.

---
