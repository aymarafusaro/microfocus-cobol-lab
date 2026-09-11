# Lesson 03 - File Processing

## Objective

This lesson introduces COBOL sequential file processing using fixed-length records.

The exercise is designed to simulate a traditional Mainframe file-processing scenario, where input files contain records with a predefined layout and fixed field positions.

## Concepts Practiced

* Sequential files
* Fixed-length records
* `FILE-CONTROL`
* `SELECT`
* `ASSIGN`
* `ORGANIZATION IS SEQUENTIAL`
* `FILE STATUS`
* File Section
* `FD`
* `RECORD CONTAINS`
* `RECORDING MODE IS F`
* Data Division
* COBOL data layouts
* `PIC` clauses
* `OPEN INPUT`
* `READ`
* `AT END`
* `CLOSE`
* Sequential record processing

## Record Layout

The input file uses records with a fixed length of **40 characters**.

| Positions | Field          | Length | COBOL Definition |
| --------- | -------------- | -----: | ---------------- |
| 1-6       | Transaction ID |      6 | `PIC X(6)`       |
| 7-16      | Account ID     |     10 | `PIC X(10)`      |
| 17-28     | Amount         |     12 | `PIC 9(10)V99`   |
| 29-36     | Status         |      8 | `PIC X(8)`       |
| 37-40     | Currency       |      4 | `PIC X(4)`       |

### COBOL Layout

```cobol
01  TRANSACTION-RECORD.
    05  TRX-ID          PIC X(6).
    05  TRX-ACCOUNT     PIC X(10).
    05  TRX-AMOUNT      PIC 9(10)V99.
    05  TRX-STATUS      PIC X(8).
    05  TRX-CURRENCY    PIC X(4).
```

The total record length is:

```text
6 + 10 + 12 + 8 + 4 = 40 characters
```

## Input File

Input file:

```text
lessons/03-file-processing/data/input/transactions.dat
```

The file contains four fixed-length records.

Unlike a conventional Unix text file, the records are not separated by newline characters.

The file contains exactly:

```text
4 records × 40 bytes = 160 bytes
```

This structure is used to simulate a fixed-length sequential file commonly found in Mainframe processing environments.

## Program

Source file:

```text
FILE-PROCESSING.CBL
```

The program performs the following operations:

1. Opens the input file.
2. Checks the file status.
3. Reads records sequentially.
4. Interprets each record according to the predefined layout.
5. Displays the transaction fields.
6. Detects the end of the file using `AT END`.
7. Closes the input file.
8. Displays a completion message.

## File Definition

The program defines the input file as a sequential fixed-length file:

```cobol
SELECT TRANSACTION-FILE
    ASSIGN TO "lessons/03-file-processing/data/input/transactions.dat"
    ORGANIZATION IS SEQUENTIAL
    FILE STATUS IS WS-FILE-STATUS.
```

The File Description specifies the record length and fixed recording mode:

```cobol
FD  TRANSACTION-FILE
    RECORD CONTAINS 40 CHARACTERS
    RECORDING MODE IS F.
```

## Compilation

From the project root:

```bash
cobc -x -o lessons/03-file-processing/file-processing lessons/03-file-processing/FILE-PROCESSING.CBL
```

## Execution

Run the compiled program with:

```bash
./lessons/03-file-processing/file-processing
```

## Expected Output

The program should process the four input transactions:

```text
TRANSACTION: 000001
ACCOUNT:     ACC0001234
AMOUNT:      0000001234.56
STATUS:      APPROVED
CURRENCY:    ARS

TRANSACTION: 000002
ACCOUNT:     ACC0005678
AMOUNT:      0000000025.00
STATUS:      APPROVED
CURRENCY:    ARS

TRANSACTION: 000003
ACCOUNT:     ACC0009012
AMOUNT:      0000075000.00
STATUS:      REJECTED
CURRENCY:    ARS

TRANSACTION: 000004
ACCOUNT:     ACC0003456
AMOUNT:      0000000001.50
STATUS:      APPROVED
CURRENCY:    ARS
```

The program finishes with:

```text
FILE PROCESSING COMPLETED.
```