#!/bin/bash

set -e

PROGRAM="lessons/10-final-project/final-project"
SOURCE="lessons/10-final-project/FINAL-PROJECT.CBL"
OUTPUT_DIR="lessons/10-final-project/data/output"

echo "========================================"
echo "       FINAL PROJECT BUILD"
echo "========================================"

echo "Compiling COBOL program..."

cobc -x -free \
    -o "$PROGRAM" \
    "$SOURCE"

echo "BUILD STATUS: SUCCESSFUL"
echo ""

rm -f "$OUTPUT_DIR/final-report.txt"

echo "Starting batch execution..."

"$PROGRAM"

RETURN_CODE=$?

echo ""
echo "BATCH RETURN-CODE: $RETURN_CODE"

if [ "$RETURN_CODE" -ne 0 ]; then
    echo "BATCH STATUS: FAILED"
    exit "$RETURN_CODE"
fi

echo "BATCH STATUS: SUCCESSFUL"
echo ""
echo "Output report:"
cat "$OUTPUT_DIR/final-report.txt"
