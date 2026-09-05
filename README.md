# Micro Focus COBOL Lab

Beginner-friendly practical course and portfolio project focused on **Micro Focus COBOL**, **Enterprise COBOL development**, **batch processing**, **debugging**, **testing**, and **Enterprise Server concepts**.

The goal of this repository is to build practical knowledge step by step while creating a portfolio project that demonstrates enterprise-oriented COBOL development.

---

## Objectives

This project is designed to learn and practice:

- Micro Focus / Enterprise COBOL development
- COBOL project organization
- COBOL source code structure
- COPYBOOKS
- Sequential file processing
- File validation and error handling
- Compilation and execution
- Debugging
- Automated regression testing
- Batch processing
- JCL concepts
- Enterprise Server concepts
- Enterprise COBOL application architecture
- Enterprise-oriented development practices

---

## Course Structure

### 01 — Environment

Introduction to the Micro Focus ecosystem and development environment.

Topics include:

- Micro Focus COBOL
- Enterprise Developer
- Enterprise Server
- Development environments
- Project structure
- Source code organization

---

### 02 — First COBOL Program

Create and execute a basic Enterprise COBOL program.

Topics include:

- COBOL program structure
- IDENTIFICATION DIVISION
- DATA DIVISION
- PROCEDURE DIVISION
- Variables
- PIC clauses
- DISPLAY
- Basic compilation and execution

---

### 03 — File Processing

Read, validate, process, and generate sequential files.

Topics include:

- FILE-CONTROL
- FILE SECTION
- FD definitions
- OPEN
- READ
- WRITE
- CLOSE
- EOF handling
- Input validation
- Error handling

---

### 04 — COPYBOOKS

Learn how COPYBOOKS are used to share data structures between COBOL programs.

Topics include:

- COPY statements
- Shared data structures
- Record definitions
- Data consistency
- Reusable COBOL structures

---

### 05 — Build & Run

Understand compilation, build processes, execution, and common errors.

Topics include:

- COBOL compilation
- Compiler options
- Build process
- Executables
- Runtime execution
- Compilation errors
- Runtime errors

---

### 06 — Debugging

Learn how to investigate and resolve problems in COBOL applications.

Topics include:

- Debugging concepts
- Breakpoints
- Variables
- Program flow
- Error investigation
- Troubleshooting techniques

---

### 07 — Testing

Create functional and regression tests for COBOL programs.

Topics include:

- Test cases
- Expected results
- Functional validation
- Regression testing
- Input/output validation
- Automated test scripts

---

### 08 — Batch Processing

Understand batch jobs, processing steps, input/output files, and JCL concepts.

Topics include:

- Batch processing
- Jobs
- Steps
- Sequential processing
- Input datasets
- Output datasets
- Return codes
- JCL concepts

---

### 09 — Enterprise Server

Introduction to Micro Focus Enterprise Server concepts and how COBOL applications can run in an enterprise environment.

Topics include:

- Enterprise Server
- Regions
- Services
- Transactions
- Enterprise applications
- COBOL runtime environments
- Mainframe-oriented concepts

---

### 10 — Final Project

Build a small banking batch-processing system combining the concepts learned throughout the course.

The final project will integrate:

- COBOL programs
- COPYBOOKS
- Sequential files
- Validation
- Batch processing
- JCL concepts
- Error handling
- Automated tests
- Technical documentation
- Enterprise-oriented architecture

---

## Project Structure

```text
microfocus-cobol-lab/
│
├── README.md
│
├── lessons/
│   ├── 01-environment/
│   ├── 02-first-cobol/
│   ├── 03-file-processing/
│   ├── 04-copybooks/
│   ├── 05-build-run/
│   ├── 06-debugging/
│   ├── 07-testing/
│   ├── 08-batch-processing/
│   ├── 09-enterprise-server/
│   └── 10-final-project/
│
├── src/
│   └── programs/
│
├── copybooks/
│
├── data/
│   ├── input/
│   ├── intermediate/
│   └── output/
│
├── tests/
│
├── scripts/
│
└── docs/
````

---

## Learning Approach

Each lesson will contain practical exercises and documentation.

The general structure will be:

1. Explanation of the concept
2. COBOL source code
3. Example input data
4. Expected output
5. Exercise
6. Test
7. Documentation
8. Git commit

The project will be developed incrementally so that every step is reproducible and can be reviewed independently.

---

## Final Project

The final project will simulate a simplified banking batch-processing system.

### Processing Flow

```text
                    BANK BATCH JOB
                          │
                          ▼
                ┌─────────────────────┐
                │ STEP 01             │
                │ Validate            │
                │ Transactions        │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ STEP 02             │
                │ Process             │
                │ Payments            │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ STEP 03             │
                │ Update              │
                │ Account Master      │
                └──────────┬──────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │ STEP 04             │
                │ Generate            │
                │ Daily Report        │
                └─────────────────────┘
```

### Final Project Architecture

```text
bank-batch-processing-system/
│
├── src/
│   └── programs/
│       ├── VALIDATE-TRANSACTIONS.CBL
│       ├── PROCESS-PAYMENTS.CBL
│       ├── UPDATE-ACCOUNTS.CBL
│       └── GENERATE-REPORT.CBL
│
├── copybooks/
│   ├── CUSTOMER.CPY
│   ├── ACCOUNT.CPY
│   ├── TRANSACTION.CPY
│   └── CONSTANTS.CPY
│
├── data/
│   ├── input/
│   ├── intermediate/
│   └── output/
│
├── jcl/
│   └── BANKBATCH.JCL
│
├── scripts/
│   ├── build.sh
│   ├── run.sh
│   └── clean.sh
│
├── tests/
│   └── regression-tests.sh
│
└── docs/
    ├── architecture.md
    └── processing-flow.md
```

---

## Batch Processing Flow

The final application will process banking transactions through multiple steps.

```text
Input Transactions
        │
        ▼
Validate Transactions
        │
        ├── Valid
        │      │
        │      ▼
        │  Process Payments
        │      │
        │      ▼
        │  Update Accounts
        │      │
        │      ▼
        │  Generate Report
        │
        └── Invalid
               │
               ▼
          Error Output
```

---

## Example Transaction

Example input:

```text
000001|123456|1500.00|PURCHASE
000002|123457|500.00|PAYMENT
000003|123458|-500.00|REFUND
```

The application will validate each transaction and determine the appropriate processing result.

Possible results include:

```text
APPROVED
REJECTED
ERROR
```

---

## Testing Strategy

The project will include different types of testing.

### Functional Testing

Verify that each program produces the expected result for valid and invalid inputs.

### Regression Testing

Verify that new changes do not break previously implemented functionality.

### File Validation

Compare:

```text
Expected Output
       │
       ▼
Actual Output
```

### Test Automation

Where possible, tests will be executed using shell scripts to make the validation process repeatable.

---

## Progress

* [ ] Lesson 01 — Environment
* [ ] Lesson 02 — First COBOL Program
* [ ] Lesson 03 — File Processing
* [ ] Lesson 04 — COPYBOOKS
* [ ] Lesson 05 — Build & Run
* [ ] Lesson 06 — Debugging
* [ ] Lesson 07 — Testing
* [ ] Lesson 08 — Batch Processing
* [ ] Lesson 09 — Enterprise Server
* [ ] Lesson 10 — Final Project

---

## Technologies & Concepts

This project may include:

* COBOL
* Micro Focus COBOL
* Enterprise COBOL
* Enterprise Developer
* Enterprise Server
* VS Code
* Git
* GitHub
* Shell scripting
* Sequential files
* COPYBOOKS
* Batch processing
* JCL concepts
* Regression testing

---

## Portfolio Purpose

This repository is part of my COBOL learning and professional portfolio.

It demonstrates practical knowledge of:

* COBOL development
* Mainframe-oriented concepts
* Batch processing
* File handling
* Testing
* Debugging
* Enterprise application organization
* Version control
* Technical documentation

The project is intentionally developed step by step, documenting both successful implementations and troubleshooting processes.

---

## Related Project

This repository is **completely separate** from my COBOL payment-processing project.

### COBOL Payment Processing System

`cobol-payment-processing`

That project focuses on:

* Transaction processing
* Account management
* Balance updates
* Audit trails
* Batch-oriented COBOL development
* Regression testing
* Versioned project development

The two repositories have independent Git histories and are maintained as separate portfolio projects.

---

## Author

**Aymara Fusaro**

COBOL Developer | Mainframe | QA | Batch Processing

---

## Project Status

**In Development**

This repository is being built progressively as a practical Micro Focus COBOL learning laboratory and portfolio project.

