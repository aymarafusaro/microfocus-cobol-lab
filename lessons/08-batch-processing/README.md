# Lesson 08 - Batch Processing

## Objective

This lesson demonstrates a COBOL batch processing workflow using sequential transaction records.

The program reads a fixed-length transaction file, processes each record sequentially, calculates summary information, and generates a batch report.

The process also uses a return code to communicate the execution status.

## Project Structure

```text
08-batch-processing/
├── BATCH-DEMO.CBL
├── README.md
├── run-batch.sh
└── data/
    ├── input/
    │   └── transactions.dat
    └── output/
        └── batch-report.txt
```

## Input File

The input file contains six fixed-length transaction records.

Each record contains:

* Transaction ID
* Account ID
* Amount
* Status
* Currency

Example record:

```text
000001ACC0001234000000123456APPROVEDARS
```

Each record has a fixed length of 40 characters.

## Batch Processing

The COBOL program performs the following steps:

1. Opens the input transaction file.
2. Opens the output report file.
3. Reads transactions sequentially.
4. Counts the total number of transactions.
5. Counts approved transactions.
6. Counts rejected transactions.
7. Accumulates the transaction amount.
8. Generates a batch report.
9. Closes the files.
10. Returns an execution status.

## Batch Report

For the current test data, the expected report is:

```text
TRANSACTIONS: 006
APPROVED: 004
REJECTED: 002
TOTAL AMOUNT: 78011.81
```

## Return Codes

The program uses `RETURN-CODE` to communicate execution status.

```text
0     = successful execution
non-0 = batch execution error
```

The program returns `1` if it cannot open the input or output file.

A successful execution returns:

```text
RETURN-CODE: 0
```

## Running the Batch

The complete process can be executed using:

```bash
./lessons/08-batch-processing/run-batch.sh
```

The script performs two main steps:

### 1. Compile

```bash
cobc -x -free \
    -o lessons/08-batch-processing/batch-demo \
    lessons/08-batch-processing/BATCH-DEMO.CBL
```

### 2. Execute

```bash
./lessons/08-batch-processing/batch-demo
```

The script checks the program return code and reports whether the batch completed successfully.

## Batch Execution Example

```text
========================================
       COBOL BATCH EXECUTION
========================================

[1] Compiling COBOL program...
Compilation successful.

[2] Executing batch program...

========================================
       BATCH PROCESSING DEMO
========================================

BATCH STATUS: STARTED
BATCH STATUS: COMPLETED
TRANSACTIONS PROCESSED: 006

BATCH COMPLETED SUCCESSFULLY.
RETURN-CODE: 0
========================================
```

## Mainframe Relevance

Batch processing is a fundamental concept in Mainframe environments.

A typical Mainframe batch process may involve:

```text
Input Dataset
      ↓
   COBOL Program
      ↓
Processing Records
      ↓
Output Dataset
      ↓
   Return Code
```

The execution of a COBOL batch program is commonly controlled by JCL.

For example, a simplified conceptual workflow is:

```text
JCL Job
   ↓
Job Step
   ↓
COBOL Program
   ↓
Input Dataset
   ↓
Processing
   ↓
Output Dataset
   ↓
Return Code
```

The local environment used in this lesson does not execute JCL. The shell script is used to simulate the orchestration of the batch process locally.

## Concepts Practiced

This lesson reinforces:

* COBOL batch processing
* Sequential file processing
* Fixed-length records
* File handling
* `READ`
* `WRITE`
* `FILE STATUS`
* `PERFORM UNTIL`
* `RETURN-CODE`
* Batch reports
* Shell-based execution
* Error handling

## Exercise

Modify the input file by adding another transaction.

Then:

1. Update the expected totals manually.
2. Run `run-batch.sh`.
3. Verify the number of processed transactions.
4. Verify the approved/rejected counts.
5. Verify the total amount.
6. Check the return code.

This demonstrates how a batch process reacts to changes in its input dataset.

## Current Environment

This lesson is executed locally using:

* macOS
* GnuCOBOL 3.2
* VS Code
* Bash
* Git

The workflow is designed to demonstrate concepts that are applicable to enterprise COBOL and Mainframe batch processing.
