data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]

}


resource "aws_instance" "jenkins" {
  # ami             = data.aws_ami.amazon-linux-2.id
  ami             = "ami-036fcf8080bce5f54"

  instance_type   = "t2.micro"
  security_groups = [aws_security_group.jenkins-sg.name]
  key_name        = "Ec2tutorial"
  provisioner "remote-exec" {
    inline = [
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
      "sudo amazon-linux-extras install epel -y",
      "sudo amazon-linux-extras install java-openjdk11 -y",
      "sudo yum install jenkins -y",
      "sudo service jenkins start",
     
     
    ]
  }
  
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("/home/muneeb/Downloads/Ec2tutorial.pem")
  }
  tags = {
    "Name" = "Jenkins1"
  }
}

resource "aws_instance" "Ruby_Rails_Deployment" {
  # ami             = data.aws_ami.amazon-linux-2.id
  ami             = "ami-036fcf8080bce5f54"

  instance_type   = "t2.micro"
  security_groups = [aws_security_group.rubyrails-sg.name]
  key_name        = "Ec2tutorial"
  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sudo yum install docker -y",
     
      "wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) ",
      "sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose",
      "sudo chmod -v +x /usr/local/bin/docker-compose"
     
     
    ]
  }
  
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("/home/muneeb/Downloads/Ec2tutorial.pem")
  }
  tags = {
    "Name" = "Ruby-onrails"
  }
}

