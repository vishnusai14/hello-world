pipeline {
    agent any
    tools{
        maven "MAVEN"
    }
    environment {
        DOCKER_CRED="docker-hub"
        DOCKER_TAG="${env.BUILD_ID}"
        DOCKER_REPO="vishnuprasanna/devops-project"
    }
    stages{
        stage("Maven Clean Install") {
            steps {
                sh 'mvn clean install'
            }
        }
        // stage("Copying the webapps.war") {
        //     steps {
        //         script {
        //             sshagent(credentials: ['ec2-ssh']) {
        //                 sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/devops-hello-world-project/webapp/target/webapp.war ubuntu@13.126.180.29:/tmp"
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 'sudo rm -rf /opt/tomcat/webapps/ROOT' "
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 'sudo mv /tmp/webapp.war /opt/tomcat/webapps/ROOT.war' "
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@13.126.180.29 'sudo systemctl restart tomcat' "
        //             }
        //         }
        //     }
        // }

        stage("Building Docker Image") {
            agent{
                label: 'docker-node'
            }
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_REPO}:${DOCKER_TAG}")
                }
            }
        }
        stage("Pushing the Docker Image") {
            agent{
                label: 'docker-node'
            }
            steps {
                script {
                    docker.withRegistry("", DOCKER_CRED) {
                        dockerImage.push(env.BUILD_ID)
                        dockerImage.push('latest')
                    }
                }
            }
        }
        // stage("Remove Docker Image Locally") {
        //     steps {
        //         sh "docker rmi ${DOCKER_REPO}:${DOCKER_TAG}"
        //         sh "docker rmi ${DOCKER_REPO}:latest"
        //     }
        // }
    }
}