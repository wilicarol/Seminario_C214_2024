pipeline {

    agent any

    stages {

        stage('Test'){

            steps {
                sh 'flutter test'
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