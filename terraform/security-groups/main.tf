resource "aws_security_group" "this" {
  name        = var.name
  description = var.description

  dynamic "ingress" {
    for_each = var.ingress_ports_specific
    content {
      protocol    = "tcp"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = var.cidr_blocks
      description =ingress.value.description
    }
  }
 dynamic "ingress" {
    for_each = var.ingress_ports_open
    content {
      protocol    = "tcp"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = ["0.0.0.0/0"]
      description =ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.egress_ports
    content {
      protocol    = "-1"
      from_port   = egress.value.port
      to_port     = egress.value.port
       cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    "Name"      = var.tag_name
    "Terraform" = "true"
  }
}
