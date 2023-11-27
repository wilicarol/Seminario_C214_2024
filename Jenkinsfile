pipeline {
    agent any

    environment {

        EMAIL= "pedrodaluzmota208@gmail.com"
    }

    stages {

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'flutter pub get'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh 'flutter test --coverage'
                    sh 'genhtml coverage/lcov.info -o coverage/html'
                }
                archiveArtifacts 'coverage/**'
            }
        }

        stage('Build App') {
            steps {
                script {
                    sh 'flutter build web'
                }
                    
            }
        }
        stage('Notification'){

            steps {
                script{
                    echo 'Notification...'
                    sh 'cd scripts'
                    sh 'chmod +x shell.sh'
                    sh './shell.sh'
                    sh 'ls'
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
