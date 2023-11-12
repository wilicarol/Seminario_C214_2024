pipeline {
    agent any
    
    stages {
        stage('Instalação do Flutter e Testes') {
            steps {
                script {
                    // Baixa e instala o Flutter
                    sh 'git clone https://github.com/flutter/flutter.git -b stable --depth 1'
                    sh 'export PATH=$PATH:`pwd`/flutter/bin'

                    // Instala dependências do Flutter
                    sh 'flutter doctor'

                    // Executa testes
                    sh 'flutter test'
                }
            }
        }
    }
}
