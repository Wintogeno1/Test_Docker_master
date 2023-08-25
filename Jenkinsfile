pipeline {
    agent any

    environment {
        EC2_INSTANCE_IP = '65.2.177.89'
        SSH_CREDENTIALS_ID = 'ec2-user@ec2-65-2-177-89'
    }

    stages {
        stage('Connect to EC2') {
            steps {
                script {
                    def sshKey = credentials("${SSH_CREDENTIALS_ID}")
                    
                    sshCommand remote: "${EC2_INSTANCE_IP}",
                               user: 'ec2-user',  // Update with your instance's username
                               key: sshKey,
                               command: 'echo "Connected to EC2 instance"'
                }
            }
        }
    }
}
