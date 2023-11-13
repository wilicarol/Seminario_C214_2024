pipeline {
    agent any

    environment {
        FLUTTER_HOME = "${WORKSPACE}/flutter"
        PATH = "${FLUTTER_HOME}/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
                    //sh 'genhtml coverage/lcov.info -o coverage/html'
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
                sh '''
                   cd scripts
                   chmod 775 *
                   ./jenkins.sh
                   '''
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
