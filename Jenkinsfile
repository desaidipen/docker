pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh "sudo docker build . -t alpine:${env.BUILD_ID}"
            }
        }
    }
}
