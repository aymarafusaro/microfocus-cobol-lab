#!/bin/bash

echo "========================================"
echo "       COBOL BATCH EXECUTION"
echo "========================================"

PROGRAM="lessons/08-batch-processing/batch-demo"
SOURCE="lessons/08-batch-processing/BATCH-DEMO.CBL"

echo ""
echo "[1] Compiling COBOL program..."

cobc -x -free \
    -o "$PROGRAM" \
    "$SOURCE"

if [ $? -ne 0 ]; then
    echo "BATCH FAILED: Compilation error."
    exit 1
fi

echo "Compilation successful."

echo ""
echo "[2] Executing batch program..."

./"$PROGRAM"

PROGRAM_STATUS=$?

if [ $PROGRAM_STATUS -ne 0 ]; then
    echo "BATCH FAILED: Program returned code $PROGRAM_STATUS."
    exit 1
fi

echo ""
echo "BATCH COMPLETED SUCCESSFULLY."
echo "RETURN-CODE: $PROGRAM_STATUS"
echo "========================================"

exit 0
