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
              input(message: 'Do you want to proceed?' , ok: 'YES I wish to proceed')
                sh 'echo "docker&8" | sudo -S docker run -idt cfe4dceaa6f2d07786c3f6833358a83975f2acc914423ed97c13b1d40d7040f5 -p 8080:80 /bin/bash'
                
                
            }
        }
        
        stage('test') {
            parallel{
                stage('Test on Webapp'){
                     steps{
                       echo 'Have to use curl command to see if the web application is up and running'
                       sh 'curl --version'
                       sh 'curl -x POST https://172.17.0.2:80'
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
