pipeline {
  agent {
    node {
      label 'Docker-slave'
    }

  }
  stages {
    stage('Checkout code') {
      steps {
        git(url: 'https://github.com/dvir770/node-hello.git', branch: 'master', changelog: true, poll: true)
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build . -t node-hello:$BUILD_ID'
      }
    }

  }
}