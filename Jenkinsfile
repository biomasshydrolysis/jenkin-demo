pipeline {
   agent any
    environment { 
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub')
        registry = "demmarss/jenkins-demo"
    }
    tools {
        dockerTool 'Docker'
        nodejs 'Node-21.5.0'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'   
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'  
            }
        }
        stage('Test') {
            steps {
                sh 'npm run test'   
            }
        }
         stage('Build image') {
            steps {             
                sh "docker build -t $registry:$BUILD_NUMBER ."
            }
        }
        stage('Login to dockerhub') {
            steps{
                sh 'docker login -u demmarss -p ${DOCKER_HUB_CREDENTIALS_PSW}'
            }
        }
        stage('Deploy image to dockerhub') {
            steps{
                sh "docker push $registry:$BUILD_NUMBER"
            }
        }
       stage('Cleaning up') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        } 
    }
}
