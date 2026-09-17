# Lesson 05 - Build & Run

## Objective

This lesson introduces a basic COBOL build and execution workflow.

The goal is to separate COBOL source code from generated executables and to create simple scripts that make the build and run process reproducible.

The local environment uses GnuCOBOL for compilation and execution.

## Concepts Practiced

* COBOL compilation
* Executable generation
* Program execution
* Build scripts
* Run scripts
* Reproducible build processes
* Separation of source code and compiled artifacts
* Basic shell scripting

## Source Program

The COBOL source is located at:

```text
lessons/05-build-run/BUILD-DEMO.CBL
```

The program demonstrates a simple processing lifecycle:

```text
INITIALIZE
    |
    v
PROCESS
    |
    v
FINALIZE
```

The program maintains a processing status using a working-storage field.

## Compilation

The program can be compiled locally with GnuCOBOL:

```bash
cobc -x -free \
    -o lessons/05-build-run/build-demo \
    lessons/05-build-run/BUILD-DEMO.CBL
```

The `-x` option creates an executable program.

The `-o` option specifies the name and location of the generated executable.

The `-free` option tells GnuCOBOL to interpret the source using free-format COBOL syntax.

This option is used in this lesson to simplify local development with GnuCOBOL. It does not represent a Micro Focus or IBM Enterprise COBOL compiler configuration.

## Execution

After compilation, the executable can be run with:

```bash
./lessons/05-build-run/build-demo
```

Expected output:

```text
========================================
       BUILD AND RUN DEMONSTRATION
========================================
PROCESS STATUS: STARTED
PROCESS STATUS: RUNNING
COBOL PROGRAM IS EXECUTING.
BUILD PROCESS COMPLETED SUCCESSFULLY
PROCESS STATUS: COMPLETED
========================================
```

## Build Script

The project includes:

```text
lessons/05-build-run/build.sh
```

The script performs the compilation automatically.

Run it with:

```bash
./lessons/05-build-run/build.sh
```

The script uses:

```bash
set -e
```

This causes the script to stop if a command fails.

A failed compilation therefore prevents the workflow from continuing as if the build had succeeded.

## Run Script

The project also includes:

```text
lessons/05-build-run/run.sh
```

The run script executes the compiled COBOL program:

```bash
./lessons/05-build-run/run.sh
```

Build and execution are intentionally separated:

```text
BUILD
  |
  v
BUILD-DEMO.CBL
  |
  v
GnuCOBOL Compiler
  |
  v
build-demo
  |
  v
RUN
```

## Source Code vs. Executable

The COBOL source file:

```text
BUILD-DEMO.CBL
```

is human-readable source code.

The compiled file:

```text
build-demo
```

is a generated executable artifact.

The executable is excluded from Git using `.gitignore`.

Generated build artifacts should generally not be committed to the source repository.

## Mainframe Relevance

In Mainframe environments, COBOL source code is normally processed through a controlled build and execution workflow rather than manually compiling every program each time.

A build process can involve:

* COBOL source code
* Copybooks
* Compiler options
* Source libraries
* Link-edit or bind steps
* Build procedures
* JCL
* Load modules or executable artifacts

This lesson provides a simplified local representation of that separation.

The workflow will become more Mainframe-oriented in later lessons when batch processing and JCL are introduced.

## Current Local Workflow

```text
COBOL SOURCE
     |
     v
 BUILD.SH
     |
     v
 GnuCOBOL
     |
     v
 EXECUTABLE
     |
     v
  RUN.SH
     |
     v
PROGRAM EXECUTION
```

This workflow is intentionally simple and serves as a foundation for later build, batch, testing, and enterprise COBOL concepts.
