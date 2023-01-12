pipeline {
    agent any
    stages {
        stage ("Compile") {
            step {
                sh "chmod +x gradlew"
                sh "./gradlew clean build"
                sh "./gradlew compileJava"
            }
        }
        stage ("Unit test") {
            step {
                sh "./gradlew test"
            }
        }
    }
}