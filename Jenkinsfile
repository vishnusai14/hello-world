pipeline {
    agent any
    tools{
        maven "MAVEN"
    }
    stages{
        stage("Maven Clean Install") {
            steps {
                sh 'mvn clean install'
            }
        }
        stage("Copying the webapps.war") {
            steps {
                script {
                    sshagent(credentials: ['ec2-ssh']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 sudo cp /var/lib/jenkins/workspace/devops-hello-world-project/webapp/target/webapp.war /opt/tomcat/webapps/"
                        
                    }
                }
            }
        }
    }
}