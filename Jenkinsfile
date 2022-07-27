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
		    
		
                
                
            }
        }
	    
	
	stage('Build Web Application'){
		steps{
			
		sh 'echo "docker&8" | sudo -S /usr/bin/docker rm -f FYP'

		echo 'this command will run the container image'
                sh 'echo "docker&8" | sudo -S docker run -d -it -h created --add-host created:10.1.0.2 --network fyp_customnetwork --ip 10.1.0.98 --name FYP fypimage /bin/bash
'			
			
		echo 'This will move the file to the container'
		sh 'echo "docker&8" | sudo -S docker cp contactus.html FYP:/opt/lampp/htdocs/contactus.html'

		echo 'Run XAMPP'
		sh 'echo "docker&8" | docker exec -it FYP /bin/bash | sudo -S /opt/lampp/lampp start' 
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
                    }
                }
            }
           
           
    }   
    
       

}
}
