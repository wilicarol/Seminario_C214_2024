pipeline {
    agent any

    environment {
        EMAIL= "pedro.mota@ges.inatel.br"
    }

    stages {

        stage('Install Dependencies') {
            steps {
                script {
                    echo 'Installing dependencies...'
                    sh 'flutter pub get'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    echo 'Testing...'
                    sh 'flutter test --coverage'
                    sh 'genhtml coverage/lcov.info -o coverage/html'
                }
                archiveArtifacts 'coverage/**'
            }
        }

        stage('Build App') {
            steps {
                script {
                    echo 'Building...'
                    sh 'flutter build web'
                }
                    
            }
        }
        stage('Notification'){

            steps {
                script{
                    echo 'Notification...'
                    sh '''
                        cd scripts
                        chmod 775 *
                        ./shell.sh $EMAIL
                       '''
                }
            }

        }
    }

    post {
        always {
            script {
                sh 'flutter clean'
            }
        }

        success {
            echo 'Build successful!'
        }

        failure {
            echo 'Build failed!'
        }
    }
}
