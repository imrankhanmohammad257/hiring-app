def call(String status = "SUCCESS") {
    def color = (status == "SUCCESS") ? "good" : "danger"
    def emoji = (status == "SUCCESS") ? "✅" : "❌"

    slackSend(
        channel: '#jenkins-integration',
        color: color,
        message: "Hi Team, Build, Slack stages are configured in Shared Library, Jenkins job for *hiring-app* finished with status: ${status} ${emoji}\nDeployed by: Imran Khan"
    )
}
