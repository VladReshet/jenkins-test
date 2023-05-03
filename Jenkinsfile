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
                cleanWs()
                
                writeFile(
                    file: 'build',
                    text: "${env.GIT_BRANCH}/${env.GIT_COMMIT}\n",
                    encoding: "UTF-8"
                )
                
                script{
                    docker.withRegistry( "https://registry.hub.docker.com/v2/", 'ca3c04e0-f23e-494c-b856-f5bdaf2581f7' ){
                        dockerImage = docker.build "vladvladvladvlad/jenkins-test:latest"
                    }
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry( "https://registry.hub.docker.com/v2/", 'ca3c04e0-f23e-494c-b856-f5bdaf2581f7' ){
                        dockerImage.push()
                     }
                }
            }
        }
        post {
            always {
                cleanWs(
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                }
            }
        }
    }
}
