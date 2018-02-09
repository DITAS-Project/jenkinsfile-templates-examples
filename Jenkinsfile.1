pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
		
		stage('Build') {
			steps {
				sh 'mvn -B -DskipTests clean package'
			}
			post {
				success {
					archive "target/**/*.jar"
				}
			}
			
		}
		stage('Test and Static analysis') {
            parallel {
				stage('Test') {
					steps {
						sh 'mvn test'
						sh 'mvn findbugs:findbugs'
					}
					post {
						always {
							junit 'target/surefire-reports/*.xml'
							cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: '**/target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 10, methodCoverageTargets: '80, 0, 0', onlyStable: false, zoomCoverageChart: false
						}
					}
				}
				stage('Static analysis') {
					steps {
						sh 'mvn findbugs:findbugs'
					}
					post {
						always {
							findbugs canComputeNew: false, defaultEncoding: '', excludePattern: '', healthy: '', includePattern: '', pattern: '**/findbugsXml.xml', unHealthy: ''
						}
					}
				}
            }
        }        
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
}
