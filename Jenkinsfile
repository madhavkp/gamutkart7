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
         stage('Run') {
             steps {
             sh 'docker start tomcat-server-qa' 
             sh 'docker exec -i tomcat-server-qa /etc/init.d/ssh start'
             
            }
       }

        stage('Deployment') {
            steps {
               
                sh 'sshpass -p "hari" scp target/gamutgurus.war hari@172.17.0.3:/home/hari/distros/apache-tomcat-9.0.85/webapps'
                sh 'sshpass -p "hari" ssh hari@172.17.0.3 "/home/hari/distros/apache-tomcat-9.0.85/bin/startup.sh"'
                
            }
        }
         stage('Notification') {
             step {
               emailext body: 'hii developer, please condider this email priority.', subject: 'Build Status', to: 'kolimadhav2012@gmail.com'
    }
}
