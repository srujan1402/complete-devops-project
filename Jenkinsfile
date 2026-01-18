pipeline {
    agent any

    parameters {
        string(name: 'VERSION', defaultValue: '1.0.0')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'test', 'staging'])
    }

    stages {

        stage('Checkout') {
            steps {
                echo "Checking out source code"
            }
        }

        stage('Build') {
            steps {
                bat 'build.bat'
            }
        }

        stage('Test') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        bat 'java -cp src\\main\\java;src\\test\\java com.devops.CalculatorTest'
                    }
                }
                stage('Integration Test') {
                    steps {
                        echo 'Integration test simulation'
                    }
                }
            }
        }

        stage('Package') {
            steps {
                bat '''
                mkdir package
                copy calculator.jar package
                echo version=%VERSION% > package\\version.txt
                '''
            }
        }

        stage('Deploy') {
            when {
                expression { params.ENVIRONMENT != 'dev' }
            }
            steps {
                echo "Deploying to ${params.ENVIRONMENT}"
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'package/**'
        }
        success {
            echo 'DevOps pipeline completed successfully'
        }
    }
}
