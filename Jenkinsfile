pipeline {
    agent any
    environment {
        // COMMIT_ID="""${sh(returnStdout: true, script: 'git rev-parse --short HEAD')}"""
	CONTAINER_ID=''
        app = ''
    }
    stages {
        stage('Build') {
            steps {
                script {
                    app = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                    
                }
                echo "Build"
            }
        }
        
        stage('Test') {
            steps {
                CONTAINER_ID = sh 'docker run -d -e NAME=${NAME} -e AGE=${AGE} -p 8081:80 ${IMAGE_NAME}:${IMAGE_TAG}'
		sh 'docker exec -ti ${CONTAINER_ID} /bin/sh'
		sh 'cat /usr/share/nginx/html/index.html'
            echo "Test"
            }
        }
        
        stage('Push') {
            steps {
                 //script {
                     //docker.withRegistry('https://registry.hub.docker.com', '${DOCKER_CREDS}') {
                     //    app.push("${env.BUILD_ID}-${COMMIT_ID}")                
                     //}
                 //}
                echo "Push"
            }
        }
    }

}
