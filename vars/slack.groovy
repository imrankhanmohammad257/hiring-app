def call(String status = "SUCCESS") {
    def color = (status == "SUCCESS") ? "good" : "danger"
    def emoji = (status == "SUCCESS") ? "✅" : "❌"

    slackSend(
        channel: '#jenkins-integration',
        color: color,
        message: "🚀 Jenkins pipeline update:
✅ *Build stage* and ✅ *Slack notification stage* have been moved to the *Jenkins Shared Library*.
Now the Jenkinsfile is clean and reusable! 🎉,   Jenkins job for *hiring-app* finished with status: ${status} ${emoji}\nDeployed by: Imran Khan"
    )
}
