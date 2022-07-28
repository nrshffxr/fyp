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
      
       stage('Approval Gatekeeper'){
            steps{
                echo 'This is the Stage'
		echo 'The Input Command will pause the pipeline untill user approval is given'
              	input(message: 'Do you want to proceed?' , ok: 'YES I wish to proceed')
		    
		
                
            }
        }
	stage('Build the Container'){
	    steps{
		echo 'this command will remove the previously running container'
		sh 'echo "docker&8" | sudo -S /usr/bin/docker rm -f FYP'

		echo 'this command will run the container image'
                sh 'echo "docker&8" | sudo -S docker container create -it --name FYP fypimage /bin/bash'
		    
		sh 'echo "docker&8" | sudo -S docker start FYP '
			
		}	
}
	    
	
	stage('Build Web Application'){
		steps{
			
		
		echo 'This will move the file to the container'
		sh 'echo "docker&8" | sudo -S docker cp contactus.html FYP:/opt/lampp/htdocs/contactus.html'
		
		sh 'echo "docker&8" | sudo -S docker cp /var/lib/jenkins/workspace/"Jenkins Pipeline"/test_script.sh FYP:/test_script.sh'

		echo 'Run XAMPP'
		
		sh 'docker exec FYP ./test_script.sh'
		}	
	}
        
        stage('test') {
            parallel{
                stage('Test on Webapp'){
                     steps{
                       echo 'Have to use curl command to see if the web application is up and running'
                       sh 'curl --version'
                       sh 'echo "docker&8" | sudo -S curl 172.17.0.3'
                    }
                }
                stage('Test on Container'){
                    steps{
                        echo 'This is a test on the container'
			sh 'echo "docker&8" | sudo -S docker exec -it FYP echo "Hello From container! " '
			
                    }
                }
            }
    }      
       

}
}
