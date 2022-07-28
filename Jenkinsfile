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

		echo 'this command will create the container'
                sh 'echo "docker&8" | sudo -S docker run -d -it -h fyp --add-host fyp:10.1.0.2 --network fyp_customnetwork --ip 10.1.0.98 --name FYP fypimage /bin/bash'
		
		echo 'this command will start the container'
		sh 'echo "docker&8" | sudo -S docker start FYP '
			
		}	
}
	    
	
	stage('Build Web Application'){
		steps{
			
		
		echo 'This will move the file to the container'
		sh 'echo "docker&8" | sudo -S docker cp contactus.html FYP:/opt/lampp/htdocs/contactus.html'
			
		sh 'echo "docker&8" | sudo -S docker exec FYP mkdir -p /var/lib/scripts'
		
		sh 'echo "docker&8" | sudo -S docker cp /var/lib/jenkins/workspace/"Jenkins Pipeline"/test_script.sh FYP:/var/lib/scripts/test_script.sh'

		sh 'echo "docker&8 | sudo -S docker cp /var/lib/jenkins/workspace/"Jenkins Pipeline"/ViewProfile.sql FYP:/var/lib/scripts/ViewProfile.sql'
			
		sh 'echo "docker&8" | sudo -S docker exec FYP mysql ViewProfile < /var/lib/scripts/ViewProfile.sql'
			
		echo 'Run XAMPP'
		
		sh 'echo "docker&8" | sudo -S docker exec FYP chmod +x /var/lib/scripts/test_script.sh' 	
		sh 'echo "docker&8" | sudo -S docker exec FYP /opt/lampp/lampp start'
		}	
	}
        
        stage('test') {
            parallel{
                stage('Test on Webapp'){
                     steps{
                       echo 'Have to use curl command to see if the web application is up and running'
                       sh 'curl --version'
                       sh 'echo "docker&8" | sudo -S curl 10.1.0.98'
                    }
                }
                stage('Test on Container'){
                    steps{
                        echo 'This is a test on the container'
			sh 'echo "docker&8" | sudo -S docker ps' 
			
                    }
                }
            }
    }      
       

}
}
