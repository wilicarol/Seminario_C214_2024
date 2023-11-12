pipeline {

    agent any

    stages {

        stage('Config Flutter'){

            steps{
                sh 'docker run --rm -v "$(pwd):/workspace" -w /workspace alpine tar --xz -xf flutter.tar.xz -C /tmp/workspace/'
            }

            steps{
                    sh '''

        
                    # Define a versão do Flutter que você deseja instalar
                    FLUTTER_VERSION="3.13.8"
                    # Define o diretório onde o Flutter será instalado
                    FLUTTER_INSTALL_DIR="/tmp/workspace/flutter/" 
                    # Pode ser alterado para um diretório de sua escolha
                    # Baixa o Flutter SDK
                    curl -o flutter.tar.xz https://flutter.dev/builds/flutter/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz
                    # Extrai o Flutter SDK para o diretório de instalação
                    dir
                        docker run --rm -v "$(pwd):/workspace" -w /workspace alpine sh -c "
                            apk --no-cache add xz
                            xz -d flutter.tar.xz
                            tar -xf flutter.tar -C /usr/local
                    export PATH="$PATH:$FLUTTER_INSTALL_DIR/bin"

                    # Atualiza os pacotes do Flutter
                    flutter precache
                    flutter --version
                '''
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