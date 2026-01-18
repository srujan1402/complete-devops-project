
package com.devops;

public class CalculatorTest {

    public static void main(String[] args) {

        Calculator calc = new Calculator();
        int passed = 0;
        int failed = 0;

        try {
            if (calc.add(5, 3) == 8) passed++;
            else failed++;
        } catch (Exception e) {
            failed++;
        }

        try {
            calc.divide(5, 0);
            failed++;
        } catch (ArithmeticException e) {
            passed++;
        }
        // Power test
try {
    int result = calc.power(2, 3);
    if (result == 8) {
        System.out.println("Power test passed");
        passed++;
    } else {
        System.out.println("Power test failed");
        failed++;
    }
} catch (Exception e) {
    System.out.println("Power test error");
    failed++;
}


        System.out.println("Passed: " + passed);
        System.out.println("Failed: " + failed);

        if (failed > 0) {
            System.exit(1);
        }
    }
}
