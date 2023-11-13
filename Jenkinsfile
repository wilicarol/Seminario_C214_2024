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

        stage('Install Flutter') {
            steps {
                script {
                    // Instalação do Flutter
                    sh 'rm -rf /var/jenkins_home/workspace/Trabalho_web/flutter'

                    sh 'git clone https://github.com/flutter/flutter.git ${FLUTTER_HOME}'
                    sh 'echo "export PATH=${FLUTTER_HOME}/bin:$PATH" >> ~/.bashrc'
                    sh 'flutter doctor'
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
                    sh 'cp -r coverage/lcov.info $JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/archive'
                
                }
                archiveArtifacts 'coverage/lcov.info'
            }
        }

        stage('Build App') {
            steps {
                script {
                    sh 'flutter build web'
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
