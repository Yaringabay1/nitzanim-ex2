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
                sh '$(aws ecr get-login --no-include-email --region eu-west-1)'
                sh 'docker tag flask_app 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest'
                sh 'docker push 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest'
            }
        }

        stage('Run The Docker Image on My Remote Server') {
            steps {
                script {
                  def secrets = readFile("secrets.txt")
                  def accessKeyId = secrets.split("\n")[0].trim()
                  def secretAccessKey = secrets.split("\n")[1].trim()
                  env.AWS_ACCESS_KEY_ID = accessKeyId
                  env.AWS_SECRET_ACCESS_KEY = secretAccessKey
                }
                sh 'ssh ubuntu@3.250.142.105 "docker pull 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest"'
                sh 'ssh ubuntu@3.250.142.105 "docker run 351141573338.dkr.ecr.eu-west-1.amazonaws.com/flask_app:latest"'
            }
        }
    }
}

