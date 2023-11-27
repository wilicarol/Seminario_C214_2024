pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                script{
                    sh 'git config --global --add safe.directory /opt/flutter'
                }
            }
        }

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
                echo 'Notification...'
                sh 'chmod 775 *'
                sh 'cd scripts && bash ./shell.sh'
                sh 'ls'
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
