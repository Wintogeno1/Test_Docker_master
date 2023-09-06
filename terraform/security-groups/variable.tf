variable "name" {
  description = "Name for the security group"
}

variable "description" {
  description = "Description for the security group"
}

# variable "ingress_ports_specific" {
#   description = "List of ingress ports open for specific IPs"
#   type        = list(number)
# }
variable "ingress_ports_specific" {
  type = list(object({
    description = string
    port        = number
  }))
 
}
variable "ingress_ports_open" {
    type = list(object({
    description = string
    port        = number
    }))
}
variable "egress_ports" {
type = list(object({
    description = string
    port        = number
  }))
}

variable "cidr_blocks" {
  description = "List of CIDR blocks"
  type        = list(string)
}
variable "tag_name" {
  description = "Tag Name of security group"
}
