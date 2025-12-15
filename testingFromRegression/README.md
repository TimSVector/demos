# VectorCAST Demo Projects - Converting from regerssion scripts to VC Projects

This repository contains demo environments for [VectorCAST](https://www.vector.com/us/en/products/products-a-z/software/vectorcast), organized by compiler toolchain.
These demos serve as reference implementations for evaluating VectorCAST in switching from regression scripts to VC Projects.

---

Regression scripts are in regressions directory
Source is in src directory 
- v1 is the standard tutorial/c demo
- v2 is my expanded point of sales demo
---

## 📁 Regression Repository Structure

```
/
D:.
│   README.md
│   setenv.bat
│   start_vc.bat
│
├───regressions
│   │   run_regression.bat
│   │
│   ├───DATABASE
│   │       DATABASE.bat
│   │       DATABASE.env
│   │       DATABASE.tst
│   ├───INTEGRATION_TEST
│   │       INTEGRATION_TEST.bat
│   │       INTEGRATION_TEST.env
│   │       INTEGRATION_TEST.tst
│   └───MANAGER
│           MANAGER.bat
│           MANAGER.env
│           MANAGER.tst
└───src
    ├───v1
    │   │   make_post.bat
    │   ├───database
    │   │   ├───inc
    │   │   └───src
    │   │           database.c
    │   ├───main
    │   │       pos_driver.c
    │   ├───order_entry
    │   │   ├───inc
    │   │   │       ctypes.h
    │   │   │
    │   │   └───src
    │   │           manager.c
    │   └───utils
    │       ├───inc
    │       └───src
    │               whitebox.c
    └───v2
        │   make_post.bat
        ├───database
        │   ├───inc
        │   │       database.h
        │   │
        │   └───src
        │           database.c
        ├───encrypt
        │   ├───inc
        │   │       encrypt.h
        │   │       matrix_multiply.h
        │   │
        │   └───src
        │           encrypt.c
        │           matrix_multiply.c
        ├───main
        │       pos_driver.c
        ├───order_entry
        │   ├───inc
        │   │       ctypes.h
        │   │       manager.h
        │   │       waiting_list.h
        │   └───src
        │           manager.c
        │           waiting_list.c
        └───utils
            ├───inc
            │       linked_list.h
            └───src
                    linked_list.c
                    whitebox.c```


---

## 🚀 Getting Started

### 1. Run the regression scripts

Double click on 

```
regressions\run_regression.bat
```

All regression scripts will run and produce 
- Testcase Management Report 
- CSV Metrics reports

---

### 2. Start VectorCAST

```
start_vc.bat
```

- Create a VC Project from existing environment, recursively include the regressions diretory
- Migrate to workspace
- Demo different settings even one missing any coverage settings (DATABASE)
- Fix the settings and rebuild envs.  All should run.

---

### 3. Switch software versions

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
