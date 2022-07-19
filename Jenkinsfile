pipeline {
  environment {
    registry = '329839090168.dkr.ecr.us-west-2.amazonaws.com/test'
    registryCredential = '329839090168'
    dockerImage = ''
  }
  agent any
  stages {
    stage('scm clone'){
            steps{
            git branch: 'main', 
			credentialsId: 'Nishant@reddy1', 
			url: 'https://github.com/GiriNishant/jenkins.git'
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
                docker.withRegistry("https://" + registry, "ecr:us-west-2:" + registryCredential) {
                    dockerImage.push()
                }
            }
        }
    }
  }
}
