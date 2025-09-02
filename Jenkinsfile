node {
    try {
        stage('Checkout SCM') {
            git branch: 'main', url: 'https://github.com/imrankhanmohammad257/hiring-app.git'
        }

        stage('Build') {
            def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
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
                mvn clean deploy -DskipTests \
                    -Dnexus.username=$NEXUS_USER \
                    -Dnexus.password=$NEXUS_PASS \
                    --settings /var/lib/jenkins/.m2/settings.xml
                '''
            }
        }

        stage('Deploy to Tomcat') {
            withCredentials([usernamePassword(credentialsId: 'tomcat-credentials', usernameVariable: 'TOMCAT_USER', passwordVariable: 'TOMCAT_PASS')]) {
                sh '''
                curl -u $TOMCAT_USER:$TOMCAT_PASS \
                     -T target/hiring.war \
                     http://54.87.222.232:8080/manager/text/deploy?path=/hiring&update=true
                '''
            }
        }

        stage('Slack Notification') {
            slackSend(
                channel: '#jenkins-integration',
                color: 'good',
                message: "Hi Team, Jenkins *Scripted Pipeline* job for *hiring-app* has finished successfully! ✅\nDeployed by: Imran Khan"
            )
        }

    } catch (err) {
        slackSend(
            channel: '#jenkins-integration',
            color: 'danger',
            message: "⚠️ Jenkins *Scripted Pipeline* for *hiring-app* failed! Please check the logs."
        )
        throw err
    } finally {
        echo 'Pipeline finished'
    }
}
