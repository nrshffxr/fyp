pipeline {
  agent any
  
    stages {
        stage('Clone Repo') {
            steps{
                step([$class: 'WsCleanup'])
              script {
                git credentialsId: '20026183-Akash' , url:'https://github.com/nrshffxr/fyp.git'
                sh "ls -lart ./*"
                sh "git branch -a"
              }
            }
        }
      
       stage('Build Container'){
            steps{
                echo 'This is the Build Stage'
		echo 'The Input Command will pause the pipeline untill user approval is given'
              	input(message: 'Do you want to proceed?' , ok: 'YES I wish to proceed')

		echo 'this command will run the container image'
                sh 'echo "docker&8" | sudo -S docker container create -it --name FYP e04290a7374b /bin/bash'
                
                
            }
        }
	
	stage('Build Web Application'){
		steps{
		echo 'This will move the file to the container'
		sh 'echo "docker&8" | docker cp contactus.html e04290a7374b:/contactus.html'

		echo 'This will move the file to the correct directory. Have to run this command inside the container'
		sh 'docker -esec -it hello-world bash | mv contactus.html /opt/lampp/htdocs'

		echo 'Run XMPP'
		sh 'run ./lampp' 
		}
		
	}
        
        stage('test') {
            parallel{
                stage('Test on Webapp'){
                     steps{
                       echo 'Have to use curl command to see if the web application is up and running'
                       sh 'curl --version'
                       sh 'curl -x POST https://172.17.0.3:80'
                    }
                }
                stage('Test on Container'){
                    steps{
                        echo 'This is a test on the container'
                    }
                }
            }
           
           
    }   
    
       

}
}
