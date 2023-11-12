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
                    sh 'git clone https://github.com/flutter/flutter.git ${FLUTTER_HOME}'
                    sh 'echo "export PATH=${FLUTTER_HOME}/bin:$PATH" >> ~/.bashrc'
                    sh 'flutter doctor'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Instalação das dependências do Flutter
                    sh 'flutter pub get'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Execução dos testes
                    sh 'flutter test'
                }
            }
        }

        stage('Build App') {
            steps {
                script {
                    // Construção do aplicativo
                    sh 'flutter build apk'
                    // Você pode usar outras opções de construção, como 'flutter build ios' para iOS
                }
            }
        }

        // Adicione mais estágios conforme necessário para implantação, notificação, etc.
    }

    post {
        always {
            // Limpeza após a execução
            script {
                sh 'flutter clean'
            }
        }

        success {
            echo 'Build successful!'
            // Adicione etapas adicionais para uma construção bem-sucedida
        }

        failure {
            echo 'Build failed!'
            // Adicione etapas adicionais para uma construção com falha
        }
    }
}
