pipeline {
    agent {
        label 'docker'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask_app .'
            }
        }

        stage('Push Docker Image to AWS ECR') {
            steps {
                env.AWS_ACCESS_KEY_ID = 'AKIAVDQNLGLNKUZUVOSJ'
                env.AWS_SECRET_ACCESS_KEY = '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'
                sh '$(aws ecr get-login --no-include-email)'
                sh 'docker tag flask_app:latest 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest'
                sh 'docker push 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest'
            }
        }
    }

        stage('Run Docker Image on Remote Server') {
            steps {
                sh 'ssh -i C:\Users\ניצנים\Downloads\devops_1 ubuntu@3.250.142.105 "docker run -d --name my_flask_container -p 5000:5000 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest"'
            }
        }
    }
}
