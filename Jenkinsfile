pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask_app .'
            }
        }

        stage('Push The Docker Image to AWS ECR') {
            steps {
                sh 'aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 351141573338.dkr.ecr.eu-west-1.amazonaws.com'
                sh 'docker tag flask_app:latest 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest'
                sh 'docker push 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest'
            }
        }

        stage('Run The Docker Image on My Remote Server') {
            steps {
                withEnv(["AWS_ACCESS_KEY_ID=AKIAVDQNLGLNKUZUVOSJ", "AWS_SECRET_ACCESS_KEY=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"]) {
                    sh 'ssh ubuntu@3.250.142.105 "docker pull 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest"'
                    sh 'ssh ubuntu@3.250.142.105 "docker run 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest"'
                }
            }
        }
    }
}
