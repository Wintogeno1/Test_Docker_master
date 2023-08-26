pipeline {
    agent any
    stages {
        stage("Aws Demo") {
            steps {
                withCredentials([[
                $class: 'AmazonWebServicesCredentialsBinding',
                credentialsId:'43.205.120.43',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
                {
                    sh "aws ec2 start-instances --instance-ids i-0a1f0c25c3572717d --region=ap-south-1"
                }
            }
        }
         stage("Install Docker") 
         {
            steps {
                script 
                        sh """
                            ssh -o StrictHostKeyChecking=no ec2-user@65.2.149.74 'sudo yum update -y'
                            ssh -o StrictHostKeyChecking=no ec2-user@65.2.149.74'sudo amazon-linux-extras install docker -y'
                            ssh -o StrictHostKeyChecking=no ec2-user@65.2.149.74'sudo service docker start'
                            ssh -o StrictHostKeyChecking=no ec2-user@65.2.149.74'sudo usermod -aG docker ec2-user'
                        """
                    
                }
            }
        }
    }
}

