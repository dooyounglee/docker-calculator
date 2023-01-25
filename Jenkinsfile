pipeline {
    agent any
    stages {
        stage ("Compile") {
            steps {
                sh "chmod +x gradlew"
                sh "./gradlew clean build"
                sh "./gradlew compileJava"
            }
        }
        stage ("Unit test") {
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
        }
        stage ("Package") {
            steps {
                sh "./gradlew build"
            }
        }
        stage ("Docker build") {
            steps {
                // sh "echo jenkins | sudo -S service docker start && echo jenkins | sudo -S chmod 666 /var/run/docker.sock && docker build -t calculator ."
                // sh "echo jenkins | sudo -S chmod 666 /var/run/docker.sock"
                sh "echo jenkins | sudo -S docker build -t gostbaducking1/calculator /var/jenkins_home/workspace/calculator"
            }
        }
        stage ("Docker hub login") {
            steps {
                sh "echo jenkins | sudo -S docker login --username gostbaducking1 --password `cat /var/jenkins_home/workspace/password.txt`"
            }
        }
        stage ("Docker push") {
            steps {
                sh "echo jenkins | sudo -S docker push gostbaducking1/calculator"
            }
        }
    }
}