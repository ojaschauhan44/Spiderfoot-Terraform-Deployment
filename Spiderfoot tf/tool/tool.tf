resource "aws_instance" "db" {
  ami = "ami-0a4a70bd98c6d6441"
  instance_type = "t2.medium"
  security_groups = [module.sg.sg_name]
  user_data = file("./tool/server-script.sh")
  key_name = "Ojas-key"
  tags = {
    Name = "Server Spiderfoot"
  }
}


module "sg" {
  source = "../sg"
}


resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.csc-osint.zone_id
  name    = "www.csc-osint.cf"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.db.public_ip]
}


resource "aws_route53_zone" "csc-osint" {
  name = "www.csc-osint.cf"
}


resource "aws_route53_record" "csc-osint" {
  allow_overwrite = true
  name            = "www.csc-osint.cf"
  ttl             = 30
  type            = "NS"
  zone_id         = aws_route53_zone.csc-osint.zone_id

  records = [
    aws_route53_zone.csc-osint.name_servers[0],
    aws_route53_zone.csc-osint.name_servers[1],
    aws_route53_zone.csc-osint.name_servers[2],
    aws_route53_zone.csc-osint.name_servers[3],
  ]
}


output "PublicIP" {
  value = aws_instance.db.public_ip
}