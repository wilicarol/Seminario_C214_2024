pipeline {
    agent any

    environment {
        FLUTTER_HOME = '/opt/flutter'
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
                    sh 'sudo -i'
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
                    sh 'flutter test'
                }
            }
        }

        stage('Build App') {
            steps {
                script {
                    sh 'flutter build apk'
                    // You can use other build options like 'flutter build ios' for iOS
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
            // Additional steps for a successful build
        }

        failure {
            echo 'Build failed!'
            // Additional steps for a failed build
        }
    }
}
