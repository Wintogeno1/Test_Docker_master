node {
    stage('Update EC2') {
        def remoteCommands = '''
           cd /home/ec2-user/rails_application
           docker-compose down
           docker rmi  wintogeno/docker_aws:latest
           docker pull wintogeno/docker_aws:latest
           docker-compose up
           


        '''

        withCredentials([sshUserPrivateKey(credentialsId: 'Jenkins_private_k', keyFileVariable: 'KEY_FILE')]) {
            writeFile text: remoteCommands, file: 'remote_commands.sh'
            sh "chmod +x remote_commands.sh"
            sh "ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} ec2-user@3.110.214.123 'bash -s' < remote_commands.sh"
        }
    }
}