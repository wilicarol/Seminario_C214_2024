pipeline {
    agent any
    environment {
      PATH = "$PATH:/tmp/workspace/flutter/bin"
    }    
    stages {
        stage('Setup') {
            steps {
                print "${env.PATH}"
            }    
        }
        
        stage('Build') {
            steps {
                sh "flutter doctor -v"
            }
        }        
    }
}