# docker-calculator

pipeline {
  agent any
  stage("Checkout" {
    steps {
      git url: 'https://github.com/dooyounglee/docker-calculator.git',
      branch: 'master'
    }
  }
}
