node {
    stage('Update EC2') {
        def remoteCommands = '''
            
           docker pull postgres:13
           docker pull wintogeno/docker_aws:latest
            
        '''

        withCredentials([sshUserPrivateKey(credentialsId: 'Jenkins_private_k', keyFileVariable: 'KEY_FILE')]) {
            writeFile text: remoteCommands, file: 'remote_commands.sh'
            sh "chmod +x remote_commands.sh"
            sh "ssh -o StrictHostKeyChecking=no -i ${KEY_FILE} ec2-user@13.126.45.239 'bash -s' < remote_commands.sh"
        }
    }
}