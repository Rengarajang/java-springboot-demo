pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh """
                cd complete/
                mvn install"""
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
