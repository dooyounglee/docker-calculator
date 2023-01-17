pipeline {
    agent any
    stages {
        stage ("Compile") {
            steps {
                sh "sudo apt-get update && apt-get -y install sudo"
                sh "sudo groupadd docker"
                sh "sudo usermod -a -G docker doo"
                sh "chmod +x gradlew"
                sh "./gradlew clean build"
                sh "./gradlew compileJava"
            }
        }
        /*stage ("Unit test") {
            steps {
                sh "./gradlew test"
            }
        }
        stage ("Code coverage") {
            steps {
                sh "./gradlew jacocoTestReport"
                publishHTML (target: [
                    reportDir: 'build/reports/tests/test',
                    reportFiles: 'index.html',
                    reportName: "JaCoCo Report"
                ])
                sh "./gradlew jacocoTestCoverageVerification"
            }
        }
        stage ("Static code analysis") {
            steps {
                sh "./gradlew checkstyleMain"
                publishHTML (target: [
                    reportDir: 'build/reports/checkstyle',
                    reportFiles: 'main.html',
                    reportName: "Checkstyle Report"
                ])
            }
        }*/
        /*stage ("Package") {
            steps {
                sh "./gradlew build"
            }
        }*/
        stage ("Docker build") {
            steps {
                sh "docker build -t calculator ."
            }
        }
    }
}