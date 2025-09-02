node {
    stage('Checkout SCM') {
        git branch: 'main',
            url: 'https://github.com/imrankhanmohammad257/hiring-app.git'
    }

    stage('Build') {
        def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
        // Ensure no old target directory blocks the build
        sh 'sudo rm -rf target'
        sh "${mvnHome}/bin/mvn clean package -DskipTests"
    }

    stage('SonarQube Analysis') {
        withSonarQubeEnv('SonarQube') {
            sh 'mvn sonar:sonar'
        }
    }

    stage('Deploy to Nexus') {
        withCredentials([usernamePassword(credentialsId: 'nexus-creds', usernameVariable: 'NEXUS_USER', passwordVariable: 'NEXUS_PASS')]) {
            sh '''
            # Update Maven settings.xml with creds
            sed -i "s|<username>.*</username>|<username>$NEXUS_USER</username>|" /var/lib/jenkins/.m2/settings.xml
            sed -i "s|<password>.*</password>|<password>$NEXUS_PASS</password>|" /var/lib/jenkins/.m2/settings.xml

            mvn clean deploy -DskipTests --settings /var/lib/jenkins/.m2/settings.xml
            '''
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
