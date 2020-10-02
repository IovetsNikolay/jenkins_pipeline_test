pipeline {
    agent any
    environment {
        // COMMIT_ID="""${sh(returnStdout: true, script: 'git rev-parse --short HEAD')}"""
        app = ''
    }
    stages {
        stage('Build') {
            steps {
                script {
                    app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                    
                }
                // sh "docker images"
                // sh "docker ps"
                echo "Build"
            }
        }
        
        stage('Test') {
            steps {
                sh 'docker run -d -e NAME=${NAME} -e AGE=${AGE} -p 8080:80 ${IMAGE_NAME}:${IMAGE_TAG}'
            echo "Test"
            }
        }
        
        stage('Push') {
            steps {
                // script {
                //     docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
                //         app.push("${env.BUILD_ID}-${COMMIT_ID}")                
                //     }
                // }
                echo "Push"
            }
        }
    }

}
