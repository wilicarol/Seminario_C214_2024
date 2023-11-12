pipeline {

    agent any

    environment {
        FLUTTER_VERSION = '3.13.8'  // Substitua pela versão desejada do Flutter
    }

    stages {

        stage('Install Brew'){
            steps{
                sh 'apk --no-cache add xz'
                
            }
        }

        stage('Config Flutter'){
            steps{

                    // Baixar e instalar o Flutter
                    sh "git clone https://github.com/flutter/flutter.git -b ${FLUTTER_VERSION} --depth 1"
                    sh "export PATH=\$PATH:`pwd`/flutter/bin"

                    // Verificar a instalação do Flutter
                    sh "flutter --version"
                
            }
        }

        stage('Test'){

            steps {
                sh 'flutter test'
                sh 'flutter test --coverage'
            }

        }

        stage('Build'){
            steps {
                sh 'flutter pub get'
                sh 'flutter build apk'
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

}
