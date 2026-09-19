#!/bin/bash

echo "========================================"
echo "       COBOL AUTOMATED TEST"
echo "========================================"

PROGRAM="lessons/07-testing/test-demo"
SOURCE="lessons/07-testing/TEST-DEMO.CBL"
INPUT="lessons/07-testing/data/input/transactions.dat"
ACTUAL="lessons/07-testing/data/output/test-results.txt"
EXPECTED="lessons/07-testing/data/expected/expected-output.txt"

echo ""
echo "[1] Compiling COBOL program..."

cobc -x -free \
    -o "$PROGRAM" \
    "$SOURCE"

if [ $? -ne 0 ]; then
    echo "TEST FAILED: Compilation error."
    exit 1
fi

echo "Compilation successful."

echo ""
echo "[2] Running COBOL program..."

./"$PROGRAM"

PROGRAM_STATUS=$?

if [ $PROGRAM_STATUS -ne 0 ]; then
    echo "TEST FAILED: Program returned code $PROGRAM_STATUS."
    exit 1
fi

echo "Program completed successfully."

echo ""
echo "[3] Comparing actual output with expected output..."

if diff -u "$EXPECTED" "$ACTUAL"; then
    echo ""
    echo "ALL TESTS PASSED."
    echo "========================================"
    exit 0
else
    echo ""
    echo "TEST FAILED: Output does not match expected result."
    echo "========================================"
    exit 1
fi
