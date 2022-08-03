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
              	input(message: 'Do you want to proceed?' , ok: 'YES I wish to proceed ')
                
            }
        }
	stage('Build the Container'){
	    steps{
		echo 'this command will remove the previously running container'
		sh 'echo "docker&8" | sudo -S /usr/bin/docker rm -f FYP'
		sh 'echo "docker&8" | sudo -S /usr/bin/docker rm -f MYSQL'

		echo 'this command will create the web container'
                sh 'echo "docker&8" | sudo -S docker run -d -it -h fyp --add-host fyp:10.1.0.2 --network fyp_customnetwork --ip 10.1.0.98 --name FYP fypimage2 /bin/bash'
		
		echo 'this command will create the mysql container'
		sh 'echo "docker&8" | sudo -S docker run -d -it -h mysqlfyp --add-host mysqlfyp:10.1.0.3 --network fyp_customnetwork --ip 10.1.0.97 --name MYSQL fypimage2 /bin/bash'
		    
		echo 'this command will start the web container'
		sh 'echo "docker&8" | sudo -S docker start FYP '
		    
		echo 'this command will start the mysql container'
		sh 'echo "docker&8" | sudo -S docker start MYSQL '
		    
			
		}	
}
	    
	
	stage('Build Web Application'){
		steps{
			
		
		echo 'This will move the .war file to the container'
		sh 'echo "docker&8" | sudo -S docker cp ViewProfile.war FYP:ViewProfile.war'
			
		echo 'Extract the .war file '
		sh 'echo "docker&8" | sudo -S docker exec FYP unzip -o ViewProfile.war -d /opt/lampp/htdocs'
			
		echo 'makes a scripts Folder' 
		sh 'echo "docker&8" | sudo -S docker exec FYP mkdir -p /var/lib/scripts'
			
		echo 'moves the .sql file into the container' 
		sh 'echo "docker&8" | sudo -S docker cp /var/lib/jenkins/workspace/"Jenkins Pipeline"/ViewProfile.sql FYP:/var/lib/scripts/ViewProfile.sql'
			
		echo 'Create the Database'
		echo 'echo "docker&8" | sudo -S docker exec FYP mysqladmin -u root@localhost create ViewProfile2'
		
		echo 'import SQL into database'
		echo 'echo "docker&8" | sudo -S docker exec FYP mysql -u root@localhost -p ViewProfile2 < /var/lib/scripts/ViewProfile.sql'
		
		echo 'Run XAMPP'	
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
	    
	    stage('Approval Gatekeeper For Web Application'){
            steps{
                echo 'This is the Stage'
		echo 'The Input Command will pause the pipeline untill user approval is given'
              	input(message: 'Do you want to rollout new feature? ' , ok: 'autobots roll out!!')
                
            }
        }
	    
	    stage("Rollout New Feature"){
	    step{
		echo 'this will move the contactus.html file into the container'
		sh 'echo "docker&8" | sudo -S docker cp contactus.html FYP:/opt/lampp/htdocs/contactus.html'
	    }
	    }
       

}
}
