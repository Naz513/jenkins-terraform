/*
Name: Jenkins Server
Description: Terraform to create a Jenkins Server on AWS.
Updated Date: 2022-01-01
*/

resource "aws_security_group" "JenkinsSG" {
  name        = "JenkinsSG"
  description = "Security Group for Jenkins Server"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH to Jenkins Server"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] //FIXME: Do not hardcode your IP and do not have it open to the world.
  }

  ingress {
    description = "HTTP for Internet Acces to the Jenkins Server"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] //FIXME: Do not hardcode your IP and do not have it open to the world.
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Traffic"
  }

  tags = {
    Name = "Jenkins Security Group"
  }
}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.latest_amzn_ami.id
  instance_type = var.instance_type_env["${var.instance_type}"]
  key_name      = "terraform-key"

  vpc_security_group_ids = [aws_security_group.JenkinsSG.id]

  provisioner "remote-exec" {
    script = "./script.sh"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("~/Desktop/ssh-keys/terraform-key.pem")
  }

  tags = {
    Name = "Jenkins Server"
  }
}
