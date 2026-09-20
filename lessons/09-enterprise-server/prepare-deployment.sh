#!/bin/bash

set -e

APP_NAME="ES-DEMO"
SOURCE="lessons/09-enterprise-server/ES-DEMO.CBL"
EXECUTABLE="lessons/09-enterprise-server/es-demo"
DEPLOYMENT_DIR="lessons/09-enterprise-server/deployment"

echo "========================================"
echo "     ENTERPRISE SERVER PREPARATION"
echo "========================================"

echo "Application: $APP_NAME"
echo "Source:      $SOURCE"
echo "Executable:  $EXECUTABLE"

if [ ! -f "$SOURCE" ]; then
    echo "ERROR: COBOL source file not found."
    exit 8
fi

if [ ! -f "$EXECUTABLE" ]; then
    echo "ERROR: Executable not found."
    echo "Run the build step before preparing deployment."
    exit 8
fi

mkdir -p "$DEPLOYMENT_DIR"

cp "$SOURCE" "$DEPLOYMENT_DIR/"
cp "$EXECUTABLE" "$DEPLOYMENT_DIR/"

echo ""
echo "Deployment package prepared successfully."
echo "Files copied to:"
echo "$DEPLOYMENT_DIR"

echo ""
echo "RETURN-CODE: 0"

exit 0