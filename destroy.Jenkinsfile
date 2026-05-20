
// Groovy variable definition for Slack Notification
def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
    'UNSTABLE': 'danger'
]

pipeline {
    agent any

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
    }

    post {
        always {
            script {
                def status = currentBuild.currentResult
                def color  = COLOR_MAP[status] ?: 'warning'

                slackSend(
                    color: color,
                    message: "Terraform Destroy Pipeline: ${status}\nJob: ${env.JOB_NAME}\nBuild: ${env.BUILD_NUMBER}"
                )
            }
        }
    }
}

