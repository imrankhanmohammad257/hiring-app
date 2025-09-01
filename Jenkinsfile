pipeline {
  agent any

  environment {
    MAVEN_HOME = tool 'Maven-3.9.11'
  }

  options { timestamps() }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/imrankhanmohammad257/hiring-app.git'
      }
    }

    stage('Build & SonarQube Analysis') {
      steps {
        withSonarQubeEnv('SonarQube') {
          sh "${MAVEN_HOME}/bin/mvn -B clean verify sonar:sonar"
        }
      }
    }

    stage('Quality Gate') {
      steps {
        timeout(time: 10, unit: 'MINUTES') {
          waitForQualityGate abortPipeline: true
        }
      }
    }

    stage('Package') {
      steps {
        sh "${MAVEN_HOME}/bin/mvn -B -DskipTests package"
      }
      post {
        success {
          archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
      }
    }
  }

  post {
    success { slackSend message: "✅ Build #${env.BUILD_NUMBER} succeeded: ${env.BUILD_URL}" }
    failure { slackSend message: "❌ Build #${env.BUILD_NUMBER} failed: ${env.BUILD_URL}" }
  }
}
