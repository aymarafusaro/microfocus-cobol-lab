# Lesson 02 — First COBOL Program

## Objective

The objective of this lesson is to create, compile, and execute the first COBOL program in the Micro Focus COBOL Lab.

This lesson introduces the basic structure of a COBOL program and the fundamental instructions required to display information on the screen and terminate the program correctly.

---

## Program

The source code for this lesson is:

`HELLO.CBL`

The program displays a welcome message and confirms that the COBOL execution environment is working.

### Source code

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       PROCEDURE DIVISION.

           DISPLAY "====================================".
           DISPLAY "       MICRO FOCUS COBOL LAB".
           DISPLAY "       FIRST COBOL PROGRAM".
           DISPLAY "====================================".
           DISPLAY " ".
           DISPLAY "Hello from Enterprise COBOL!".
           DISPLAY "This is my first program.".
           DISPLAY " ".

           STOP RUN.
```

---

## COBOL Program Structure

A COBOL program is organized into divisions.

### 1. IDENTIFICATION DIVISION

This division identifies the program.

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
```

`PROGRAM-ID` defines the name of the program.

In this lesson, the program name is:

```text
HELLO
```

---

### 2. ENVIRONMENT DIVISION

This division describes aspects of the environment in which the program operates.

For this first program, no additional configuration is required.

```cobol
       ENVIRONMENT DIVISION.
```

File handling and other environment-related configurations will be introduced in later lessons.

---

### 3. DATA DIVISION

The DATA DIVISION is used to define data items, variables, files, and other structures used by the program.

In this first program, no variables are required.

```cobol
       DATA DIVISION.
```

Variables and file definitions will be introduced in subsequent lessons.

---

### 4. PROCEDURE DIVISION

The PROCEDURE DIVISION contains the executable instructions of the program.

```cobol
       PROCEDURE DIVISION.
```

The instructions in this section are executed sequentially.

---

## DISPLAY

The `DISPLAY` statement writes information to the standard output.

For example:

```cobol
           DISPLAY "Hello from Enterprise COBOL!".
```

When the program is executed, the message appears in the terminal.

Multiple `DISPLAY` statements can be used to create formatted output.

---

## STOP RUN

The `STOP RUN` statement terminates the execution of the COBOL program.

```cobol
           STOP RUN.
```

It marks the end of the program's execution.

---

## Compilation

The program was compiled using GnuCOBOL.

Command:

```bash
cobc -x -o lessons/02-first-cobol/hello lessons/02-first-cobol/HELLO.CBL
```

The command generates an executable named:

```text
hello
```

inside the lesson directory.

The compilation completed successfully without errors or warnings.

---

## Execution

The program was executed with:

```bash
./lessons/02-first-cobol/hello
```

Expected output:

```text
====================================
       MICRO FOCUS COBOL LAB
       FIRST COBOL PROGRAM
====================================
Hello from Enterprise COBOL!
This is my first program.
```

---

## Compilation Flow

The complete process used in this lesson is:

```text
HELLO.CBL
    |
    v
COBOL Compiler
    |
    v
hello executable
    |
    v
Program execution
    |
    v
Terminal output
```

---

## Concepts Learned

This lesson introduced:

* COBOL program structure
* `IDENTIFICATION DIVISION`
* `PROGRAM-ID`
* `ENVIRONMENT DIVISION`
* `DATA DIVISION`
* `PROCEDURE DIVISION`
* `DISPLAY`
* `STOP RUN`
* COBOL compilation
* COBOL program execution
* Generated executable files
* Git `.gitignore` configuration for compiled binaries

---

## Git Practice

The generated executable is intentionally excluded from Git using `.gitignore`.

Current rule:

```text
lessons/02-first-cobol/hello
```

The source code is version-controlled, while the executable can be regenerated from the source.

This follows a common software development practice: generated build artifacts should not normally be committed when they can be reproduced from source code.

---

## Exercise Checklist

* [x] Create `HELLO.CBL`
* [x] Write the first COBOL program
* [x] Compile the program
* [x] Resolve the missing newline warning
* [x] Execute the program successfully
* [x] Configure `.gitignore`
* [x] Verify that the executable is ignored
* [x] Commit the source code
* [x] Push the lesson to GitHub

---

## Environment Note

The program was compiled using GnuCOBOL on macOS as part of the initial development phase.

The purpose of this lesson is to establish the COBOL fundamentals before introducing the Linux-based Micro Focus/Enterprise COBOL environment.

Future lessons will progressively introduce concepts closer to an enterprise COBOL development workflow.

---

## Next Lesson

**Lesson 03 — File Processing**

The next lesson will introduce:

* Sequential files
* `SELECT`
* `FD`
* `OPEN`
* `READ`
* `WRITE`
* `CLOSE`
* Input and output files
* Basic file processing logic
* Validation of file records

This will move the laboratory from a simple console program toward a more realistic enterprise COBOL workload.
