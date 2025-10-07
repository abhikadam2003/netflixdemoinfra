provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-02d26659fd82cf299"
  instance_type          = "t2.medium"
  key_name               = "user1"
  vpc_security_group_ids = ["sg-0c4e71988d34dff4e"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
