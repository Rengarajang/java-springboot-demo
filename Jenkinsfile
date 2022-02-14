pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh """
                cd ${WORKSPACE}/complete/
                mvn install -DskipTests
		docker build -t ci-demo-app .
		"""
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
				    ssh -o StrictHostKeyChecking=no rengs@192.168.1.3 "docker run -d -p 9099:8080 ci-demo-app"
	            '''
                }
            }
        }
    }
}
