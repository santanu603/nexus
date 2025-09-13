pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('git-cre')
        IMAGE_NAME = "your-dockerhub-username/static-html-site"
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/santanu603/nexus.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push $IMAGE_NAME:$BUILD_NUMBER'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker stop static-html || true && docker rm static-html || true'
                sh 'docker run -d -p 80:80 --name static-html $IMAGE_NAME:$BUILD_NUMBER'
            }
        }
    }

    post {
        success {
            echo "✅ Static website deployed successfully!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
