pipeline {
    agent {
        label 'localrunner'
    }
    environment {
        dockerImage = ''
    }

    stages {
        stage('Build') {
            steps {
                script{
                    dockerImage = docker.build("alpine")
                }         
            }
        }
    }
}
