pipeline {
	environment {	
registry = "rengarajang/ci-demo-app"
registryCredential = 'dockerhub_id'
dockerImage = ''
	}	
  agent any

    stages {
        stage('Build') {
            steps {
                sh """
                cd ${WORKSPACE}/complete/
                mvn install -DskipTests
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
	stage('Building our image') {
	    steps{
                script {
		cd ${WORKSPACE}/complete/
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                 }
             }
         }    
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
