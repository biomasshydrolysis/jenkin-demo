pipeline {
   agent { docker { image 'node:20.10.0-alpine3.19' } }
   docker push demmarss/jenkins-demo:tagname
    environment { 
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub')
        registry = "demmarss/jenkins-demo"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    stages {
        stage('Install Dependencies') {
            steps {
               sh 'node --version'
                echo 'Testing is running'
                echo "nice to have ${DOCKER_HUB_CREDENTIALS_USR}"
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
         stage('Building our image') {
            steps {
                echo 'Testing is running'
                sh 'npm run test'
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy our image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
       stage('Cleaning up') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        } 
    }
}