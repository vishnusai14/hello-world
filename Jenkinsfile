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
        stage("Simple SSH") {
            steps {   
                sh "ssh -i /var/lib/jenkins/.ssh/ansible_key -o StrictHostKeyChecking=no ec2-user@13.126.180.29 uname -a" 
            }
        }
    }
}