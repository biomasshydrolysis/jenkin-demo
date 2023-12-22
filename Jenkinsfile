pipeline {
   agent { docker { image 'node:20.10.0-alpine3.19' } }
    stages {
        stage('Install Dependencies') {
            steps {
               sh 'node --version'
                echo 'Testing is running'
            }
        }
        stage('Build') {
            steps {
                echo 'Building is running'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing is running'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Testing is running'
            }
        }
    }
}