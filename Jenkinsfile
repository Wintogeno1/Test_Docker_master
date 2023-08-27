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
        
        stage('Install Docker') {
            steps {
                script
                {
                sh 'sudo yum update -y'
                sh 'sudo amazon-linux-extras install docker -y'
                sh 'sudo service docker start'
                sh 'sudo usermod -aG docker ec2-user'
                }

            }
        }
            
        
    }
}

    


