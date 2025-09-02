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

    stage('Deploy to Nexus') {
        def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
        withCredentials([usernamePassword(credentialsId: 'nexus-creds', usernameVariable: 'NEXUS_USER', passwordVariable: 'NEXUS_PASS')]) {
            sh """
            sed -i "s|<username>.*</username>|<username>\$NEXUS_USER</username>|" /var/lib/jenkins/.m2/settings.xml
            sed -i "s|<password>.*</password>|<password>\$NEXUS_PASS</password>|" /var/lib/jenkins/.m2/settings.xml
            ${mvnHome}/bin/mvn clean deploy -DskipTests --settings /var/lib/jenkins/.m2/settings.xml
            """
        }
    }

    stage('Deploy to Tomcat') {
        withCredentials([usernamePassword(credentialsId: 'tomcat-credentials', usernameVariable: 'TOMCAT_USER', passwordVariable: 'TOMCAT_PASS')]) {
            sh '''
            curl -u $TOMCAT_USER:$TOMCAT_PASS \
                 -T target/hiring.war \
                 http://54.145.142.96:8080/manager/text/deploy?path=/hiring&update=true
            '''
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
