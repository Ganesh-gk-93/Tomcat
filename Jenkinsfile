pipeline {
    agent any
    environment {
        IMAGE_NAME = "sample-tomcat"
        CONTAINER_NAME = "tomcat-demo"
    }
    stages {
        stage('Build Docker image') {
            steps {
                script {
                    docker.build(IMAGE_NAME)
                }
            }
        }
        stage('Run container') {
            steps {
                sh "docker run -d -p 8080:8080 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }
        stage('Test') {
            steps {
                sh 'curl -s http://localhost:8080/ | grep "Hello from Tomcat"'
                sh 'curl -s http://localhost:8080/sample/ | grep "Hello from Sample WAR!"'
            }
        }
    }
    post {
        always {
            sh 'docker rm -f ${CONTAINER_NAME} || true'
        }
    }
}
