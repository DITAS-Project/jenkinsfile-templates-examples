pipeline {
    agent any
    stages {
        stage ('Checkout') {
            options {
                // Don't checkout the repo where it is this Jenkinsfles, just the target repos of this pipeline
                skipDefaultCheckout true
            }
            parallel {
                
                stage('Checkout vdc-logging') {
                    steps {
                        dir('vdc-logging') {
                            git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Logging-Agent.git'
                        }
                    }
                }
                stage('Checkout vdc-request') {
                    steps {
                        dir('vdc-logging') {
                            git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Request-Monitor.git'
                        }
                    }
                }
                stage('Checkout vdc-throughput') {
                    steps {
                        dir('vdc-logging') {
                            git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Throughput-Agent.git'
                        }
                    }
                }
            }
        }
    }
}
