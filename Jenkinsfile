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
                writeJSON(
                    file: 'build.txt',
                    json: [
                        gitBranch: env.GIT_BRANCH,
                        gitCommit: env.GIT_COMMIT
                    ],
                    pretty: 4
                )
                
                script{
                    docker.withRegistry( "https://registry.hub.docker.com/v2/", 'ca3c04e0-f23e-494c-b856-f5bdaf2581f7' ){
                        dockerImage = docker.build "vladvladvladvlad/jenkins-test:latest"
                    }
                }


                cleanWs(
                    patterns: [
                        [pattern: 'build.txt', type: 'INCLUDE'],
                    ]
                )
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
