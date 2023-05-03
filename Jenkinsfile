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
                        dockerImage = docker.build "vladvladvladvlad/jenkins-test:v2"
                    }
                }
                
                echo "BUILD: ${env.GIT_BRANCH}/${env.GIT_COMMIT}"
                
                writeFile(file: 'build', text: "${env.GIT_BRANCH}/${env.GIT_COMMIT}\r\n")
                
                echo "Saved to file ✅"
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
