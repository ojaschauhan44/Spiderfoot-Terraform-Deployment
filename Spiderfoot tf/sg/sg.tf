
variable "ingress" {
  type = list(number)
  default = [80,443]
}


output "sg_name" {
  value = aws_security_group.web_traffic.name
}

resource "aws_security_group" "web_traffic" {
  name = "Allow Web Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port = port.value
      to_port = port. value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      #cidr_blocks = ["168.230.2.0/24","165.225.35.0/24","4.59.124.0/24","165.225.104.0/24","165.225.34.0/24"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}