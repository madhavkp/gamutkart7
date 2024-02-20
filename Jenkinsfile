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
                docker start tomcat-server-qa
                docker exec -i tomcat-server-qa /etc/init.d/ssh start
                sh 'sshpass -p "lion" scp target/gamutgurus.war lion@172.17.0.2:/home/lion/distros/apache-tomcat-9.0.86/webapps'
                sh 'sshpass -p "lion" ssh lion@172.17.0.2 "/home/lion/distros/apache-tomcat-9.0.86/bin/startup.sh"'
                
            }
        }
    }
}
