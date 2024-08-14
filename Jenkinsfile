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
                        sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/devops-hello-world-project/webapp/target/webapp.war ubuntu@13.126.180.29:/tmp"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 'sudo rm -rf /opt/tomcat/webapps/ROOT' "
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 'sudo mv /tmp/webapp.war /opt/tomcat/webapps/ROOT.war' "
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 'sudo systemctl restart tomcat' "
                    }
                }
            }
        }
    }
}