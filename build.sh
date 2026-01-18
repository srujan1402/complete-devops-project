#!/bin/bash

echo "=== DevOps Calculator Build ==="
echo "Build Number: ${BUILD_NUMBER:-local}"

find src -name "*.java" > sources.txt
javac @sources.txt || exit 1

java -cp src/main/java:src/test/java com.devops.CalculatorTest || exit 1

jar cfe calculator.jar com.devops.Calculator -C src/main/java .

echo "Build completed successfully"
