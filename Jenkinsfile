pipeline {
   agent { docker { image 'node:20.10.0-alpine3.19' } }
    DOCKER-HUB-CREDENTIALS = credentials('docker-hub')
    stages {
        stage('Install Dependencies') {
            steps {
               sh 'node --version'
                echo 'Testing is running'
                echo $DOCKER-HUB-CREDENTIALS
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                echo 'Building is running'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing is running'
                sh 'npm run test'
            }
        }
        stage('Deploy artifact to docker-hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-pwd', variable: 'dockerhubpwd')])
                sh 'docker login -u demmarss -p ${dockerhubpwd}'
                echo 'Deployment is running'
            }
        }
    }
}