pipeline {
    agent any
    
    parameters { choice(name: 'Environment', choices: ['Staging', 'PreProd', 'Prod'], description: 'Profile needs to be used while executing test') }
    
    stages{
        stage('CleanUp Stage'){
            
            steps{
                bat 'echo CleanUp Stage'
                cleanWs notFailBuild: true
            }
        }
        
         stage('Git Checkout Stage'){
            
            steps{
                bat 'echo Git Checkout Stage'
                checkout([$class: 'GitSCM', branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abhishekarora099/KarateAutomationFramework2.git']]])
            }
        }
        
        stage('Restore Package Stage'){
            
            steps{
                bat 'echo Restore Package'
            }
        }
        
        stage('Build Stage Stage'){
            
            steps{
                bat 'echo Build Stage'
                bat 'mvn clean compile'
            }
        }
        
        stage('Test Execution Stage'){
            
            steps{
                bat 'echo Test Execution Started'
                bat 'mvn -P %Environment% test'
            }
        }
        
    }
    
    post {
  always {
      junit 'target/surefire-reports/*.xml'
      cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/karate-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
    // One or more steps need to be included within each condition's block.
  }
}

}