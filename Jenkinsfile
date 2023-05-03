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
                    docker.withRegistry( "https://registry.hub.docker.com/v2/", 'ca3c04e0-f23e-494c-b856-f5bdaf2581f7' ){
                        dockerImage = docker.build "vladvladvladvlad/jenkins-test:latest"
                    }
                }
                
                echo "BUILD: ${env.GIT_BRANCH}/${env.GIT_COMMIT}"
                sh '"' + env.GIT_BRANCH + '/' + env.GIT_COMMIT + '" > test.txt'
            }
        }
        stage('push') {
            steps {
                script {
                    docker.withRegistry( "https://registry.hub.docker.com/v2/", 'ca3c04e0-f23e-494c-b856-f5bdaf2581f7' ){
                        dockerImage.push()
                     }
                }
            }
        }
    }
}
