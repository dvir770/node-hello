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
    
    stage('Push Docker Image') {
      steps {
        withDockerRegistry(credentialsId: 'docker-hub-creds', url: 'https://index.docker.io/v1/') {
           sh '''docker tag node-hello:$BUILD_ID lidorlg/node-hello:$BUILD_ID && docker tag node-hello:$BUILD_ID lidorlg/node-hello:latest && docker push lidorlg/node-hello:$BUILD_ID && docker push lidorlg/node-hello:latest'''
         }
      }
    }

  }
}
