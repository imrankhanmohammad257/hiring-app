node {
    stage('Checkout SCM') {
        git branch: 'main',
            url: 'https://github.com/imrankhanmohammad257/hiring-app.git'
    }

    stage('Build') {
        def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
        sh "${mvnHome}/bin/mvn clean package -DskipTests"
    }

    stage('SonarQube Analysis') {
        def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
        withSonarQubeEnv('SonarQube') {
            sh "${mvnHome}/bin/mvn sonar:sonar"
        }
    }

  


    stage('Slack Notification') {
        slackSend(
            channel: '#jenkins-integration',
            color: 'good',
            message: "Hi Team, Jenkins Scripted pipeline job for *hiring-app* has finished successfully! ✅\nDeployed by: Imran Khan"
        )
    }
}
