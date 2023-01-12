pipeline {
    agent any
    stages {
        stage ("Compile") {
            step {
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