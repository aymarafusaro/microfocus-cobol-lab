# Lesson 06 - Debugging

## Objective

This lesson introduces debugging concepts in COBOL using GnuCOBOL as the local development environment.

The exercise demonstrates how to identify and correct a logical error in a COBOL program.

## Program

The program is located at:

```text
lessons/06-debugging/DEBUG-DEMO.CBL
````

The program processes three transactions.

Each transaction has an amount of `100.00`.

The expected result is:

```text
TRANSACTIONS: 003
TOTAL AMOUNT: 00000300.00
```

## Intentional Logical Error

The first version of the program contained a logical error.

The current transaction amount was accumulated without being reset before processing the next transaction.

The values became:

```text
Transaction 1 -> 100.00
Transaction 2 -> 200.00
Transaction 3 -> 300.00
```

The total therefore became:

```text
600.00
```

instead of:

```text
300.00
```

The program compiled and executed successfully, so this was not a compile-time or runtime error.

It was a logical error.

## Fix

The problem was corrected by resetting the current transaction amount before processing each transaction:

```cobol
MOVE 0 TO WS-CURRENT-AMOUNT
```

The corrected processing logic is:

```cobol
PROCESS-TRANSACTION.

    MOVE 0 TO WS-CURRENT-AMOUNT
    ADD 100.00 TO WS-CURRENT-AMOUNT
    ADD 1 TO WS-TRANSACTION-COUNT
    ADD WS-CURRENT-AMOUNT TO WS-TOTAL-AMOUNT.
```

After the correction, the program produces:

```text
TRANSACTIONS: 003
TOTAL AMOUNT: 00000300.00
```

## Debug Build

The program can be compiled with GnuCOBOL debugging support:

```bash
cobc -x -free --debug \
    -o lessons/06-debugging/debug-demo-debug \
    lessons/06-debugging/DEBUG-DEMO.CBL
```

The resulting executable can be run with:

```bash
./lessons/06-debugging/debug-demo-debug
```

The `--debug` option enables additional runtime checking and debugging support.

The `-g` option can also be used when compiling:

```bash
cobc -x -free -g \
    -o lessons/06-debugging/debug-demo \
    lessons/06-debugging/DEBUG-DEMO.CBL
```

## Types of Errors

### Compile-Time Error

The compiler detects a problem before the executable is created.

Examples:

* Invalid COBOL syntax
* Undefined paragraph
* Invalid data declaration
* Missing required COBOL structure

The program cannot be executed successfully until the error is corrected.

### Runtime Error

The program compiles successfully but encounters a problem during execution.

Examples can include:

* Invalid file operation
* Numeric conversion problems
* Division by zero
* Invalid runtime conditions

Debugging and runtime checking can help identify these problems.

### Logical Error

The program compiles and executes, but produces an incorrect result.

The intentional error in this lesson was a logical error.

The program produced:

```text
TOTAL AMOUNT: 00000600.00
```

even though the expected result was:

```text
TOTAL AMOUNT: 00000300.00
```

The compiler could not identify this problem because the COBOL statements were syntactically valid.

## Important Variables

The program uses three working-storage variables:

```cobol
01 WS-TRANSACTION-COUNT PIC 9(3) VALUE 0.
01 WS-TOTAL-AMOUNT      PIC 9(8)V99 VALUE 0.
01 WS-CURRENT-AMOUNT    PIC 9(8)V99 VALUE 0.
```

Their purpose is:

| Variable               | Purpose                                       |
| ---------------------- | --------------------------------------------- |
| `WS-TRANSACTION-COUNT` | Counts processed transactions                 |
| `WS-TOTAL-AMOUNT`      | Accumulates the total amount                  |
| `WS-CURRENT-AMOUNT`    | Stores the amount for the current transaction |

When debugging COBOL applications, inspecting these variables helps determine where an unexpected result originates.

## Debugging Approach

A practical debugging process is:

1. Reproduce the problem.
2. Identify the expected result.
3. Compare the expected and actual results.
4. Identify the variables involved.
5. Trace the processing logic.
6. Inspect variable values during execution.
7. Locate the incorrect operation.
8. Correct the program.
9. Recompile.
10. Execute the program again.
11. Verify the corrected result.
12. Add or update tests when appropriate.

## Mainframe Relevance

Debugging is an important part of COBOL development and production support.

In Mainframe environments, debugging may involve:

* COBOL source code
* Batch programs
* JCL
* Sequential files
* VSAM files
* DB2 data
* CICS transactions
* Job output
* Return codes
* Abends
* Dumps
* Variable values
* Program flow

Enterprise COBOL environments such as Micro Focus Enterprise Developer provide additional debugging tools, including graphical debugging capabilities depending on the configured environment.

This local lesson uses GnuCOBOL to practice the underlying debugging concepts without representing it as a Micro Focus Enterprise Developer debugger.

## Local Environment

This lesson was developed locally on macOS using:

* GnuCOBOL 3.2
* VS Code
* Git
* GitHub

The debugging options used here are specific to the local GnuCOBOL environment.

## Key Takeaways

* A program can compile successfully and still contain logical errors.
* Runtime debugging does not automatically detect every logical problem.
* Accumulators must be carefully initialized and reset when required.
* Inspecting intermediate variable values is an important debugging technique.
* Expected versus actual results are useful when isolating logical errors.
* Mainframe debugging involves both program logic and the surrounding execution environment.

````
