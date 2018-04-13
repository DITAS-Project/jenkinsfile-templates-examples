pipeline {
    agent any
    stages {
        stage ('Checkout') {
            parallel {
                stage('Checkout vdc-logging') {
                    dir('vdc-logging') {
                        git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Logging-Agent.git'
                    }
                }
                stage('Checkout vdc-request') {
                    dir('vdc-logging') {
                        git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Request-Monitor.git'
                    }
                }
                stage('Checkout vdc-throughput') {
                    dir('vdc-logging') {
                        git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Throughput-Agent.git'
                    }
                }
            }
        }
    }
}
