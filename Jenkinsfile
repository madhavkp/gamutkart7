pipeline {
    agent any

//	tools {
//		jdk 'jdk11'
//	}
//	environment {
//		M2_INSTALL = "/usr/bin/mvn"
//	}

    stages {
        stage('Clone-Repo') {
	    	steps {
	        	checkout scm
	    	}
        }

        stage('Build') {
            steps {
                sh 'mvn install -Dmaven.test.skip=true'
            }
        }
		
        stage('Unit Tests') {
            steps {
                sh 'mvn compiler:testCompile'
                sh 'mvn surefire:test'
                junit 'target/**/*.xml'
            }
        }

        stage('Deployment') {
            steps {
                sh 'sshpass -p "hanuman" scp target/gamutgurus.war ram@172.17.0.2:/home/ram/distros/apache-tomcat-9.0.85/webapps'
                sh 'sshpass -p "hanuman" ssh ram@172.17.0.2 "/home/ram/distros/apache-tomcat-9.0.85/bin/startup.sh"'
            }
        }
    }
}
