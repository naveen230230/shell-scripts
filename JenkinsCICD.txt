pipeline {
	agent {
		label 'build'
	}
	stages {
			stage('Checkout-Stage') {
						steps {
							git branch: 'main', credentialsId: 'github', url: 'https://github.com/sudheer76R/java-example.git'
						}
			}

			stage('Test-stage') {
						steps {
							echo 'This is a test case and is taken care while building an artifact itself'
						}
			}

			stage('Build-stage') {
						steps {
							sh 'mvn clean package'
						}
			}

			stage('Deploy-stage') {
						steps {
						    sh 'sudo cp target/*.war /opt/tomcat/apache-tomcat-9.0.68/webapps'
						}
			}

	}
}
