# Lesson 04 - Copybooks

## Objective

This lesson introduces COBOL copybooks and demonstrates how reusable data structures can be shared between COBOL programs.

The transaction record layout used in the previous lesson is moved into a shared copybook and then included in a new COBOL program using the `COPY` statement.

## Concepts Practiced

* COBOL copybooks
* `COPY` statement
* Reusable data structures
* Shared record layouts
* Fixed-length record structures
* Separation of data definitions and program logic
* Code reuse and maintainability

## Copybook

The shared transaction record is defined in:

```text
copybooks/TRANSACTION-RECORD.CPY
```

The copybook contains:

```cobol
01  TRANSACTION-RECORD.
    05  TRX-ID          PIC X(6).
    05  TRX-ACCOUNT     PIC X(10).
    05  TRX-AMOUNT      PIC 9(10)V99.
    05  TRX-STATUS      PIC X(8).
    05  TRX-CURRENCY    PIC X(4).
```

This structure represents a fixed-length transaction record.

## Using the Copybook

The demonstration program includes the shared structure with:

```cobol
WORKING-STORAGE SECTION.

COPY "copybooks/TRANSACTION-RECORD.CPY".
```

The program can then use the fields defined by the copybook:

```cobol
MOVE "000005" TO TRX-ID
MOVE "ACC0007890" TO TRX-ACCOUNT
MOVE 1500.75 TO TRX-AMOUNT
MOVE "APPROVED" TO TRX-STATUS
MOVE "ARS " TO TRX-CURRENCY
```

## Compilation

From the project root:

```bash
cobc -x -o lessons/04-copybooks/copybook-demo lessons/04-copybooks/COPYBOOK-DEMO.CBL
```

## Execution

```bash
./lessons/04-copybooks/copybook-demo
```

## Expected Output

```text
========================================
       COPYBOOK DEMONSTRATION
========================================
TRANSACTION: 000005
ACCOUNT:     ACC0007890
AMOUNT:      0000001500.75
STATUS:      APPROVED
CURRENCY:    ARS
========================================
```

## Why Copybooks Matter

Copybooks allow common data definitions to be maintained in a single location and reused by multiple COBOL programs.

In Mainframe environments, copybooks are commonly used for:

* File record layouts
* Database-related structures
* Communication areas
* Common data definitions
* Shared constants and fields

This avoids duplicating the same structure across multiple programs.

If the shared transaction layout changes, the copybook can be updated and the programs that use it can be recompiled.

## Relationship With Lesson 03

In Lesson 03, the transaction record was initially defined directly inside the COBOL program.

The record definition has now been moved to:

```text
copybooks/TRANSACTION-RECORD.CPY
```

Lesson 03 also uses this shared copybook:

```cobol
COPY "copybooks/TRANSACTION-RECORD.CPY".
```

Lesson 04 demonstrates the same concept from a separate COBOL program.

## Mainframe Relevance

Copybooks are a fundamental part of COBOL development in enterprise Mainframe environments.

Large applications often contain many programs that depend on the same record definitions. Using shared copybooks helps maintain consistency and reduces duplicated data definitions.

This lesson establishes the foundation for later topics such as batch processing, testing, file validation, and enterprise COBOL development.
