# Lesson 07 - Testing

## Objective

This lesson introduces automated testing for a COBOL batch program.

The objective is to validate that the program:

* Compiles successfully.
* Executes successfully.
* Returns a successful return code.
* Processes the expected number of transactions.
* Calculates the expected totals.
* Produces an output file that matches the expected result.

## Project Structure

```text
07-testing/
├── TEST-DEMO.CBL
├── README.md
├── run-tests.sh
└── data/
    ├── input/
    │   └── transactions.dat
    └── expected/
        └── expected-output.txt
```

The program generates the actual output in:

```text
data/output/test-results.txt
```

## Test Data

The input file contains four fixed-length transaction records.

Each record contains:

* Transaction ID
* Account ID
* Amount
* Status
* Currency

Expected results:

```text
TRANSACTIONS: 004
APPROVED: 003
REJECTED: 001
TOTAL AMOUNT: 76261.06
```

## Automated Test

The `run-tests.sh` script performs the complete validation process.

### Step 1 - Compile

The COBOL source is compiled using GnuCOBOL:

```bash
cobc -x -free \
    -o lessons/07-testing/test-demo \
    lessons/07-testing/TEST-DEMO.CBL
```

### Step 2 - Execute

The compiled program is executed:

```bash
./lessons/07-testing/test-demo
```

The program returns:

```text
0
```

A return code of `0` indicates successful execution.

### Step 3 - Compare Results

The generated output is compared with the expected output using:

```bash
diff -u expected actual
```

If there are no differences, the test passes.

## Running the Test

From the repository root:

```bash
./lessons/07-testing/run-tests.sh
```

Expected result:

```text
========================================
       COBOL AUTOMATED TEST
========================================

[1] Compiling COBOL program...
Compilation successful.

[2] Running COBOL program...
Program completed successfully.

[3] Comparing actual output with expected output...

ALL TESTS PASSED.
========================================
```

## Testing Concepts

### Expected vs Actual

Automated tests compare the program output against a predefined expected result.

```text
Expected Output
       ↓
    Compare
       ↑
Actual Output
```

If the values differ, the test fails.

### Return Codes

The program uses a return code to communicate execution status.

```text
0     = successful execution
non-0 = execution error
```

This concept is especially important in batch processing environments.

### Regression Testing

Once the expected behavior is defined, the test can be executed again after future code changes.

This helps detect regressions where a new change unintentionally breaks existing functionality.

### Test Data

The input file provides controlled test data so that the expected result can be calculated in advance.

Controlled test data is important for repeatable testing.

## Mainframe Relevance

Automated testing is an important part of enterprise COBOL development.

In a Mainframe environment, testing may involve:

* Batch programs
* JCL jobs
* Sequential files
* VSAM files
* DB2 data
* Return codes
* Job steps
* Regression testing
* Test environments
* Production validation

The concepts demonstrated here can be transferred to larger COBOL and Mainframe testing workflows.

## Exercise

Modify the input data and predict the expected result before running the test.

For example:

1. Add another approved transaction.
2. Update `expected-output.txt`.
3. Run `run-tests.sh`.
4. Verify that all tests pass.

Then intentionally modify the expected result and run the test again.

The test should fail because the actual output no longer matches the expected output.

This demonstrates the difference between a successful test and a failed test.

## Current Environment

This lesson is executed locally using:

* macOS
* GnuCOBOL 3.2
* VS Code
* Bash
* Git

The workflow demonstrates COBOL testing concepts locally while keeping them applicable to enterprise and Mainframe environments.
