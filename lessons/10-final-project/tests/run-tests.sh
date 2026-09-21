#!/bin/bash

set -e

PROGRAM="lessons/10-final-project/final-project"
EXPECTED="lessons/10-final-project/tests/expected-output.txt"
ACTUAL="lessons/10-final-project/data/output/final-report.txt"

echo "========================================"
echo "       FINAL PROJECT TESTS"
echo "========================================"

echo "Building application..."

cobc -x -free \
    -o "$PROGRAM" \
    lessons/10-final-project/FINAL-PROJECT.CBL

echo "Build completed."
echo ""

echo "Running application..."

"$PROGRAM"

RETURN_CODE=$?

if [ "$RETURN_CODE" -ne 0 ]; then
    echo "ERROR: Application returned code $RETURN_CODE"
    exit "$RETURN_CODE"
fi

echo "Application return-code: 0"
echo ""

echo "Comparing expected and actual output..."

if diff -u "$EXPECTED" "$ACTUAL"; then
    echo ""
    echo "ALL TESTS PASSED."
    exit 0
else
    echo ""
    echo "TESTS FAILED."
    exit 1
fi
