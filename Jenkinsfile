@Library("imran-shared-library") _    

node {
    stage('Checkout SCM') {
        git branch: 'main',
            url: 'https://github.com/imrankhanmohammad257/hiring-app.git'
    }

    stage('Build') {
        buildApp()   // ✅ from library
    }

    stage('SonarQube Analysis') {
        def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
        withSonarQubeEnv('SonarQube') {
            sh "${mvnHome}/bin/mvn sonar:sonar"
        }
    }

   
    stage('Slack Notification') {
        slack("SUCCESS")   // ✅ from library
    }
}
