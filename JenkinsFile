pipeline {
  agent any
  
    stages {
        stage('build') {
            steps{
                step([$class: 'WsCleanup'])
                sh 'git clone https://github.com/nrshffxr/fyp/tree/akash2'
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
