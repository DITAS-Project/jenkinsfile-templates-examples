pipeline {
    agent any
    stages {
        stage ('Checkout') {
            options {
                // Don't checkout the repo where it is this Jenkinsfles, just the target repos of this pipeline. Must be set at every stage.
                skipDefaultCheckout true
            }
            parallel {                
                stage('Checkout vdc-logging') {
                    options { skipDefaultCheckout true }
                    steps {
                        dir('vdc-logging') {
                            git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Logging-Agent.git'
                        }
                    }
                }
                stage('Checkout vdc-request') {
                    options { skipDefaultCheckout true }
                    steps {
                        dir('vdc-request') {
                            git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Request-Monitor.git'
                        }
                    }
                }
                stage('Checkout vdc-throughput') {
                    options { skipDefaultCheckout true }
                    steps {
                        dir('vdc-throughput') {
                            git changelog: false, credentialsId: 'Aitor-IDEKO-GitHub', poll: false, url: 'https://github.com/DITAS-Project/VDC-Throughput-Agent.git'
                        }
                    }
                }
            }
        }
    }
}
