provider "aws" {
    region = "ap-south-1"
}

resource "aws_key_pair" "ojasKey" {
    key_name   = "Ojas-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAm1FLUurvOG+bewbS0+uhYOWx7BLFMVjmbc9HBm3mQeBAXsIErs2YinaU31Z9bK34UoEqI7KJRlkr+pSfTNQ53yiXKSAcG0MCc6RGsHHdmjDbNqpMn5yReb79ZHxpxOdnGWs9r0smFjokGA6F0uGGKWyW3KNAbQzY1uQTwklA/vEKxWAagzBrCb2m5EC02yZtG7ZujEfO8jmyEv7GQIQ6kzldK2IP/36CJylYObBm7/Y9uH5zUvBddFsId8kbEBDvMiFH+luMAjHeUltafUWhhW0NtdDb1/9XGSZ0rcGYYHF/3PUAX5gpYY6oU+AWhepDQHvPF8T/56XEoPtr0CkJlw== rsa-key-20201217"
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