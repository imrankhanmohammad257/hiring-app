def call(String status = "SUCCESS") {
    def color = (status == "SUCCESS") ? "good" : "danger"
    def emoji = (status == "SUCCESS") ? "✅" : "❌"

    slackSend(
        channel: '#jenkins-integration',
        color: color,
        message: """🚀 Jenkins pipeline update:
hiring-app Job finished with status: *${status}* ${emoji}
(From Shared Library)"""
    )
}
