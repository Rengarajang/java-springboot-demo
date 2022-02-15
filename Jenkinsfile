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
		cp target/java-springboot-demo-1.0.0.jar /tmp/
		"""
            }
        }
     /*   stage('Test') {
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
        }  */
	stage('Building image') {
	    steps{
                script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                 }
             }
         }
	stage('Publish image') {
	    steps{
	      script {
	      docker.withRegistry( '', registryCredential ) {
	     dockerImage.push()
	   }
	 }
	}
}
	    
      stage('Deploy') {
        agent {
                label 'windows'
            }     
	      steps {
		      bat """
		      hostname
		      docker run -d -p 9099:8080 rengarajang/ci-demo-app:${BUILD_NUMBER}
                    """
                }
            }
	    stage('PerfTest') {
		steps {
                	sh """
                    /usr/local/apache-jmeter-5.4.3/bin/jmeter -n -t jplan-cidemo.jmx -l ci-demo.jtl -j ci-demo.logs	

		"""
            }
	  }	    
    }
	
    post {
	    always {
            junit 'complete/target/surefire-reports/TEST-*.xml'
        }
    }	
}
