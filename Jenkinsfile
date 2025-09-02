pipeline {
    agent any

    environment {
        MAVEN_HOME = "/usr/share/maven"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/your-org/simplecustomerapp.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar -DskipTests'
                }
            }
        }

        stage('Deploy to Nexus') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'nexus-creds',
                                                 usernameVariable: 'NEXUS_USER',
                                                 passwordVariable: 'NEXUS_PASS')]) {
                    sh '''
                        cd $WORKSPACE
                        mvn clean deploy -DskipTests \
                          --settings /var/lib/jenkins/.m2/settings.xml
                    '''
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'tomcat-creds',
                                                 usernameVariable: 'TOMCAT_USER',
                                                 passwordVariable: 'TOMCAT_PASS')]) {
                    sh '''
                        WAR_FILE=$(ls target/*.war | head -n 1)
                        curl -u $TOMCAT_USER:$TOMCAT_PASS \
                             --upload-file $WAR_FILE \
                             "http://54.145.142.96:8080/manager/text/deploy?path=/simplecustomerapp&update=true"
                    '''
                }
            }
        }
    }
}
