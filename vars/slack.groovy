def call() {
    slackSend(
        channel: '#jenkins-integration',
        color: 'good',
        message: """🚀 Jenkins pipeline update:
✅ *Build stage* and ✅ *Slack notification stage* have been moved to the *Jenkins Shared Library*.
Now the Jenkinsfile is clean and reusable! 🎉"""
    )
}
