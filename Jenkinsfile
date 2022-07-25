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
        
        stage('test') {
            parallel{
                stage('Test on Webapp'){
                     steps{
                        sh 'python3 -m pytest test_sample.py --verbose'
                    }
                }
                stage('Test on Container'){
                    steps{
                        echo 'This is a test on the container'
                    }
                }
            }
           
           
    }   
    
        stage('deploy'){
            steps{
                echo 'This is the Deployment Stage'
            }
        }

}
}
