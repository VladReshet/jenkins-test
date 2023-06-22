import groovy.json.JsonOutput


def currentTime = new Date().format("yyyy-MM-dd HH:mm")

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
                echo JsonOutput.toJson([
                    a: 'test'
                ])
                
                writeFile(
                    file: 'build.txt',
                    text: "${env.GIT_BRANCH}/${env.GIT_COMMIT}/${currentTime}\n",
                    encoding: 'UTF-8'
                )
                
                script{
                    docker.withRegistry( "https://registry.hub.docker.com/v2/", 'ca3c04e0-f23e-494c-b856-f5bdaf2581f7' ){
                        dockerImage = docker.build "vladvladvladvlad/jenkins-test:latest"
                    }
                }
            }

            post {
                always {
                    cleanWs(
                        patterns: [
                            [pattern: 'build.txt', type: 'INCLUDE'],
                        ]
                    )
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
    }
}
