pipeline {
    agent any
    environment {
        NEXUS_USER = 'admin'
        NEXUS_PASS = 'admin123'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                git url: 'https://github.com/imrankhanmohammad257/hiring-app.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                tool name: 'Maven-3.8.4', type: 'maven'
                sh 'mvn clean package -DskipTests'
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
        sh 'mvn clean deploy -DskipTests --settings /var/lib/jenkins/.m2/settings.xml'
    }
}

    }
    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
