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
                script {
                    sshagent(credentials: ['ec2-ssh']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 uname -a"
                    }
                }
            }
        }
    }
}