provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secret access key"
}
//////////////////////////creation starts

resource "aws_instance" "myec2" {
  ami           = "ami-0f5ee92e2d63afc18"  # Replace with your desired AMI ID  
  instance_type = "t2.nano"
  root_block_device {
    volume_size = 8  # Replace with your desired root volume size (in GB)
    volume_type = "gp2"
  }
}

resource "aws_security_group" "mysg" {
  name        = "my-security-group"
  description = "My security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add any other necessary ingress rules for your use case

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "self-cloud-server"
  }
}

#output "instance_ips" {
#  value = aws_instance.example.*.public_ip
#}
