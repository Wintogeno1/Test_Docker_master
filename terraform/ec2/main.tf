resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = local.tags
  security_groups = var.security_group_names

  provisioner "remote-exec" {
    inline = var.provisioner_inline
  }

}
locals {
  tags = {
    "Name" = var.name
  }
}

