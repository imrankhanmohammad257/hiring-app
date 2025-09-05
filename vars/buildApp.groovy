def call() {
    def mvnHome = tool name: 'Maven-3.8.4', type: 'maven'
    sh "${mvnHome}/bin/mvn clean package -DskipTests"
}
