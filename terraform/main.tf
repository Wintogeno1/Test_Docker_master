module "jenkins_security_group" {
  source                 = "./security-groups"
  name                   = "Allow web traffic"
  tag_name               = var.security_group_name_prefix-jenkins
  description            = "inbound ports for ssh and standard http and everything outbound"
  ingress_ports_specific = [var.ingress_ports_specific]
  ingress_ports_open     = [var.port_http, var.ports_https]
  egress_ports           = [var.egress_ports]
  cidr_blocks            = [var.your_ip]
}

module "rails_security_group" {
  source                 = "./security-groups"
  name                   = "Rails Security Group"
  tag_name               = var.security_group_name_prefix-rails
  description            = "Rails Security Group"
  ingress_ports_specific = [var.ingress_ports_specific]
  ingress_ports_open     = [var.port_http, var.ports_https]
  egress_ports           = [var.egress_ports]
  cidr_blocks = [var.your_ip, var.jenkins_ip]
}

module "jenkins_ec2" {
  name   = "Jenkins1"
  source = "./ec2"
  ami           = var.ami_id
  instance_type = var.instance_type
  depends_on = [module.jenkins_security_group]
  security_group_names = [module.jenkins_security_group.security_group_name]
  provisioner_inline = var.jenkins_provisioner_commands
}

module "rails_ec2" {
  name   = "Ruby-onrails"
  source = "./ec2"
  ami           = var.ami_id
  instance_type = var.instance_type
  depends_on    = [module.rails_security_group]
  security_group_names = [module.rails_security_group.security_group_name]
  provisioner_inline = var.rails_provisioner_commands
}

