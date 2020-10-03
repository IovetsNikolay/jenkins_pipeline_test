import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                    properties([pipelineTriggers([pollSCM('*/1 * * * *')])])
                }
                git branch: 'master', credentialsId: '9abcf84f-08f7-4c19-b21d-5d2e860f4563', url: 'https://github.com/IovetsNikolay/jenkins_pipeline_test'
                echo "Build"
            }
        }

        stage('Test') {
            steps {
                //sh 'docker run -d -e NAME=${NAME} -e AGE=${AGE} -p 8083:80 ${IMAGE_NAME}:${IMAGE_TAG}'
                //sh 'curl 127.0.0.1'
                echo "Test"
            }
        }

        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
                        app.push(getDate())
                    }
                }
                echo "Push"
            }
        }
    }
    post {
        success {
            echo 'This will run only if successful'
            mail to: 'indicow@gmail.com',
                    subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                    body: "Something is wrong with ${env.BUILD_URL}"
        }
        failure {
            echo 'This will run only if failed'
        }
    }

}

String getDate() {
    DateTimeFormatter f = DateTimeFormatter.ofPattern("yyyy-MM-dd-hh-mm");
    return LocalDateTime.now().format(f)
}