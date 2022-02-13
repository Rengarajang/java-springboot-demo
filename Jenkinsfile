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
        stage('Sonar') {
            steps {
                sh """
                cd ${WORKSPACE}/complete/
                mvn sonar:sonar
                """
            }
        }        
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
