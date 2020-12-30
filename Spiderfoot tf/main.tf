provider "aws" {
    region = "ap-south-1"
}

resource "aws_key_pair" "ojasKey" {
    key_name   = "Ojas-key"
    public_key = "ssh-rsa key here"
}

resource "aws_vpc" "example" {
    cidr_block = "10.0.0.0/24"
}

module "spiderfoot" {
    source = "./tool"
}

output "PublicIP" {
    value = module.spiderfoot.PublicIP
}
