pipeline {
    agent any

    environment {

        EMAIL= "pedrodaluzmota208@gmail.com"
    }

    stages {

        stage('Install Dependencies') {
            steps {
                script {
                    scho 'Installing dependencies...'
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
                    sh 'chmod 775 *'
                    sh 'cd scripts && ./shell.sh $EMAIL'
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
