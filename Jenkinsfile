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
      
       stage('deploy'){
            steps{
                echo 'This is the Deployment Stage'
            }
        }
        
        stage('test') {
            parallel{
                stage('Test on Webapp'){
                     steps{
                        echo 'Have to use curl command to see if the web application is up and running'
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
