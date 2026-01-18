@echo off
echo === DevOps Calculator Build ===
echo Build Number: %BUILD_NUMBER%

echo.
echo Compiling source files...

dir /s /b src\*.java > sources.txt
javac @sources.txt

IF ERRORLEVEL 1 (
    echo Compilation failed
    exit /b 1
)

echo.
echo Running tests...

java -cp src\main\java;src\test\java com.devops.CalculatorTest

IF ERRORLEVEL 1 (
    echo Tests failed
    exit /b 1
)

echo.
echo Creating JAR file...

jar cfe calculator.jar com.devops.Calculator -C src\main\java .

echo Build completed successfully
