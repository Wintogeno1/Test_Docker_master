# Security Group
variable "my_ip" {
  description = "ip_address"
  default = "206.84.191.189/32"
  
}

variable "Jenkins_ip" {
  description ="Ec2 jenkins public ip address"
  default= "43.205.127.255/32"
  
}




variable "ingressports" {
  type    = list(number)
  default = [443,  80]
}

resource "aws_security_group" "jenkins-sg" {
  name        = "Allow web traffic"
  description = "inbound ports for ssh and standard http and everything outbound"
  dynamic "ingress" {
    for_each = var.ingressports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name"      = "Jenkins-sg"
    "Terraform" = "true"
  }
}

resource "aws_security_group" "rubyrails-sg" {
  name        = "Rails Security Group"
  description = "Rails Security Group"
  
  dynamic "ingress" {
    for_each = var.ingressports
    content {
      protocol    = "tcp"
      from_port   = ingress.value
      to_port     = ingress.value
      cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP and HTTPS from everywhere
    }
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]  # Allow SSH only from my IP
  }
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.Jenkins_ip] 
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    "Name"      = "rubyrails-sg"
    "Terraform" = "true"
  }
}
