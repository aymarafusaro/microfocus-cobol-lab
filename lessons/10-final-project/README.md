# Lesson 10 — Final COBOL Batch Project

## Objective

This lesson integrates the concepts developed throughout the previous lessons into a complete COBOL batch processing project.

The project demonstrates:

- COBOL batch processing
- Shared copybooks
- Fixed-length transaction records
- Sequential file processing
- Transaction classification
- Amount accumulation
- Report generation
- Return-code handling
- Automated testing
- JCL concepts

## Application

The main program is:

```text
FINAL-PROJECT
```

Source file:

```text
FINAL-PROJECT.CBL
```

The program reads transaction records, classifies them as approved or rejected, calculates transaction totals, and generates a final report.

## Input File

The input file is:

```text
data/input/transactions.dat
```

Each record has a fixed length of 40 characters.

The transaction layout is provided through the shared copybook:

```text
copybooks/TRANSACTION-RECORD.CPY
```

The layout contains:

- Transaction ID
- Account ID
- Amount
- Transaction status
- Currency

The project processes 8 input transactions.

## Processing

For each transaction, the program:

1. Reads the input record.
2. Moves the record into the shared transaction layout.
3. Increments the transaction counter.
4. Classifies the transaction as approved or rejected.
5. Accumulates the corresponding amount.
6. Accumulates the overall transaction amount.
7. Generates a final batch report.

## Output

The generated report is:

```text
data/output/final-report.txt
```

The validated result is:

```text
TRANSACTIONS: 0008
APPROVED: 0005
REJECTED: 0003
APPROVED AMOUNT: 2771.81
REJECTED AMOUNT: 75750.00
TOTAL AMOUNT: 78521.81
```

## Return Code

The application uses the return code to indicate execution status.

A successful execution returns:

```text
RETURN-CODE: 0
```

The local shell also reports:

```text
0
```

This demonstrates the relationship between an application return code and the operating system process status.

## Build and Run

The application can be built manually with:

```text
cobc -x -free \
    -o lessons/10-final-project/final-project \
    lessons/10-final-project/FINAL-PROJECT.CBL
```

It can then be executed with:

```text
./lessons/10-final-project/final-project
```

A dedicated script is also provided:

```text
./lessons/10-final-project/run-final-project.sh
```

The script builds the application, removes the previous report, executes the batch process, checks the return code, and displays the generated report.

## Automated Testing

Automated tests are located in:

```text
tests/run-tests.sh
```

The test process:

1. Builds the COBOL application.
2. Executes the application.
3. Checks the application return code.
4. Compares the generated report with the expected output.
5. Returns code 0 when all tests pass.

The test result was:

```text
ALL TESTS PASSED.
```

## JCL Representation

The project also includes a conceptual JCL member:

```text
jcl/FINALJOB.jcl
```

The JCL represents how the COBOL batch program could be associated with a Mainframe batch job.

The main execution step is represented as:

```text
//STEP01   EXEC PGM=FINAL-PROJECT
```

The JCL also represents input and output DD statements and a load library.

This JCL file is a documentation artifact for the portfolio. It is not executed on macOS.

## Local Execution vs. Mainframe Execution

The actual local workflow is:

```text
FINAL-PROJECT.CBL
       |
       v
    GnuCOBOL
       |
       v
 final-project
       |
       v
transactions.dat
       |
       v
final-report.txt
```

A conceptual Mainframe workflow would be:

```text
JCL Job
   |
   v
EXEC PGM=FINAL-PROJECT
   |
   v
COBOL Load Module
   |
   v
Input Dataset
   |
   v
Batch Processing
   |
   v
Output Dataset
```

The local environment demonstrates the COBOL processing logic and testing workflow, while the JCL file documents the corresponding Mainframe batch concepts.

## Project Structure

```text
10-final-project/
├── FINAL-PROJECT.CBL
├── README.md
├── run-final-project.sh
├── jcl/
│   └── FINALJOB.jcl
├── data/
│   ├── input/
│   │   └── transactions.dat
│   └── output/
│       └── final-report.txt
├── tests/
│   ├── expected-output.txt
│   └── run-tests.sh
└── deployment/
```

Generated executables and output files are excluded from Git.

## What I Practiced

- COBOL batch development
- Sequential file processing
- Copybook usage
- Fixed-length record handling
- Business-rule classification
- Numeric accumulation
- Report generation
- Return-code management
- Shell-based build automation
- Automated regression testing
- JCL batch concepts
- Separation between source code and generated artifacts

## Mainframe Relevance

The project combines several concepts commonly encountered in enterprise COBOL environments: structured COBOL programs, copybooks, batch processing, datasets represented through input and output files, return codes, automated validation, and JCL-based job orchestration.

The local implementation uses GnuCOBOL on macOS, while the JCL artifact documents the corresponding Mainframe batch execution model.
