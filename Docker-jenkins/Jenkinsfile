pipeline {
  environment {
    registry = '289987706411.dkr.ecr.us-east-1.amazonaws.com/jenkins'
    registryCredential = '289987706411'
    dockerImage = ''
  }
  agent any
  stages {
    stage('scm clone'){
            steps{
            git branch: 'main', 
			credentialsId: 'SnehaLellasneha-9121806763', 
			url: 'https://github.com/SnehaLella/Docker-on-jenkins.git'
            }
        }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy image') {
        steps{
            script{
                docker.withRegistry("https://" + registry, "ecr:us-east-1:" + registryCredential) {
                    dockerImage.push()
                }
            }
        }
    }
  }
}