pipeline {
   agent any
    environment { 
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub')
        registry = "demmarss/jenkins-demo"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    tools {
        dockerTool 'Docker'
        nodejs 'Node-21.5.0'
    }

    stages {
        stage('Install Dependencies') {
            steps {
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
                echo 'Building our docker image is running'                
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
