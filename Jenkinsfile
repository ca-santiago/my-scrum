pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-scrum'
        DOCKER_CONTAINER = 'my-scrum'
        DOCKER_NETWORK = 'websites-network'
        PORT = 3002
    }

    stages {
        stage('Build image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Run container') {
            steps {
                script {
                    // Stop and remove the container if it is already running
                    sh """
                    if [ \$(docker ps -q -f name=${DOCKER_CONTAINER}) ]; then
                        docker stop ${DOCKER_CONTAINER}
                        docker rm ${DOCKER_CONTAINER}
                    fi
                    """
                    // Run the new container
                    sh "docker run -d --name ${DOCKER_CONTAINER} -p ${PORT}:3000 ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
