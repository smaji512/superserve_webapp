pipeline {
   agent any

   stages {
       stage('Clone') {
            steps {
                echo "checking out the repo"
                git 'https://github.com/smaji512/superserve_webapp.git'
            
            }
        }
		
		stage('Complie Code'){
               steps {
			   
                    sh "./gradlew build"
                }
		}
		
		stage('SonarQube Code Analysis'){
               environment {
						scannerHome = tool 'sonar_scanner'
					}
			steps {
					withSonarQubeEnv('SonarQube') {
					sh "${scannerHome}/bin/sonar-scanner"
					}
			
				}
		}
		
		stage("Unit test"){
               steps {
                    sh "./gradlew test"
               }
        }
		
		stage("Docker build") {
				steps {
      
				sh "sudo docker build -t smaji512/superserve_webapp ."
			}	
		}
		
		stage("Deploy App to Container") {
				steps {
				    
				sh "sudo docker run -d --rm -p 3333:8888 --name superserve smaji512/superserve_webapp"
			}
		}
		stage("Perform Selenium Test") {
				steps {
				
				sleep 30
 
				sh "sudo  java -jar /var/lib/jenkins/workspace/Pipeline-CapstoneProject/superservetest_chrome.jar "
			}
		}
		
		stage("Destroy Tmp Container") {
				steps {
 
				sh "sudo docker stop superserve"
			}
		}
		
		stage("Docker push") {
				steps {
					sh "sudo docker login -u smaji512 -p Chints@07"
					sh "sudo docker push smaji512/superserve_webapp"
			}
		}
		
		stage('clean up') {

            steps {

                echo "cleaning up the workspace"

                cleanWs()

            }

        }

	}
}
