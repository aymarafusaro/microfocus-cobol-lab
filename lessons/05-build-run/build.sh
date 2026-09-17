#!/bin/bash

set -e

echo "========================================"
echo "       COBOL BUILD PROCESS"
echo "========================================"

echo "Compiling BUILD-DEMO.CBL..."

cobc -x -free \
    -o lessons/05-build-run/build-demo \
    lessons/05-build-run/BUILD-DEMO.CBL

echo "Build completed successfully."
echo "Executable: lessons/05-build-run/build-demo"
