variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "ap-south-1"
}


variable "ami_id" {
  description = "AMI ID for instances"
  default       = "ami-036fcf8080bce5f54"
}

variable "aws_profile" {
  description = "AWS profile"
  default = ""
}

variable "your_ip" {
  description = "Your public IP address"
  default = "39.41.9.64/32"
}

variable "jenkins_ip" {
  description = "Jenkins server's public IP address"
  default= "13.127.224.251/32"
}



variable "security_group_name_prefix-rails" {
  description = "Prefix for security group names"
  default     = "rubyrails-sg"
}
variable "security_group_name_prefix-jenkins" {
  description = "Prefix for security group names"
  default     = "Jenkins-sg"
}



variable "ports_https" {
  default = 443
  
}

variable "ingress_ports_specific" {
  type = list(object({
    description = string
    port        = number
  }))
  default = [
    {
      description = "Allows SSH access"
      port        = 22
    },
    {
      description = "Allows HTTP traffic"
      port        = 80
    },
    {
      description = "Allows HTTPS traffic"
      port        = 443
    }
  ]
}

variable "egress_ports" {
  type = list(object({
    description = string
    port        = number
  }))
  default = [
    {
      description = "Allows SSH access"
      port        = 0
  
    }
  ]
}
variable "port_http" {

  default = 80
  
}

variable "protocol" {
  default = "tcp"
  
}

# variable "ami_id" {
#   description = "AMI ID for instances"
#   ami         = "ami-036fcf8080bce5f54"
# }

variable "instance_type" {
  description = "Instance type for instances"
  default     = "t2.micro"
}

variable "jenkins_provisioner_commands" {
  description = "Provisioner commands for Jenkins instance"
  type        = list(string)
  default = [
    "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
      "sudo amazon-linux-extras install epel -y",
      "sudo amazon-linux-extras install java-openjdk11 -y",
      "sudo yum install jenkins -y",
      "sudo service jenkins start",
  ]
}

variable "rails_provisioner_commands" {
  description = "Provisioner commands for Rails instance"
  type        = list(string)
  default = [
    "sudo yum upgrade -y",
    "sudo yum install -y docker",
    "sudo systemctl start docker",
    "sudo systemctl enable docker",
    "sudo systemctl status docker",
    "sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
    "sudo chmod +x /usr/local/bin/docker-compose",
    "docker-compose version",
  ]
}




