pipeline {
    agent {label 'docker'}
    environment {
        dockerImage = ''
    }

    stages {
        stage('Build') {
            steps {
                script{
                    dockerImage = docker.build "alpine"
                }         
            }
        }
    }
}
