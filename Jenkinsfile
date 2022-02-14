pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh """
                cd ${WORKSPACE}/complete/
                mvn install -DskipTests"""
            }
        }
  /**      stage('Test') {
            steps {
                sh """
                cd ${WORKSPACE}/complete/
                mvn compile test"""
            }
        }
        stage('Sonar') {
            steps {
                sh """
                cd ${WORKSPACE}/complete/
                mvn sonar:sonar
                """
            }
        }    **/    
        stage('Deploy') {
            steps {
               sshagent (credentials:['hostssh']) {
	        sh '''
				    ssh -o StrictHostKeyChecking=no rengs@192.168.1.3 "docker ps"
	            '''
                }
            }
        }
    }
}
