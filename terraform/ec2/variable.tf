variable "ami" {
  description = "ID of the AMI to launch"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "security_group_names" {
  description = "List of security group names"
  type        = list(string)
}

variable "provisioner_inline" {
  description = "List of inline commands for provisioner"
  type        = list(string)
}

variable "name" {
  description = "name"
}