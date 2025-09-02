pipeline {
    agent any

    environment {
        SONARQUBE = 'SonarQube'
        SLACK_CHANNEL = '#jenkins-integration'
        PATH = "/usr/lib/jvm/java-17-openjdk/bin:/usr/local/bin:/usr/bin:/bin:$PATH"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/imrankhanmohammad257/hiring-app.git'
            }
        }

      stage('Build') {
    steps {
        script {
            def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
            sh "${mvnHome}/bin/mvn clean package -DskipTests"
        }
    }
}


        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        

       stage('Deploy to Nexus') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'nexus-creds', // your Jenkins credentials ID
            usernameVariable: 'NEXUS_USER',
            passwordVariable: 'NEXUS_PASS'
        )]) {
            sh 'mvn clean deploy -DskipTests'
        }
    }
}


    post {
        success {
            slackSend(channel: env.SLACK_CHANNEL, color: 'good', message: "✅ Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' succeeded. Build URL: ${env.BUILD_URL}")
        }
        failure {
            slackSend(channel: env.SLACK_CHANNEL, color: 'danger', message: "❌ Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' failed. Build URL: ${env.BUILD_URL}")
        }
        always {
            echo "Pipeline finished"
        }
    }
}
