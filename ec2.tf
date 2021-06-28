data "template_file" "init" {
  template = file(var.install_cpanel)
}

resource "aws_key_pair" "tf-cpanel-aws" {
  key_name   = "tf-cpanel-aws"
  public_key = file(var.ssh_key)
}

resource "aws_instance" "tf-cpanel" {
  ami                         = var.ami
  instance_type               = var.instance_type
  private_ip                  = var.private_ip
  key_name                    = aws_key_pair.tf-cpanel-aws.key_name
  vpc_security_group_ids      = [aws_security_group.sg_allow_tf_cpanel.id]
  subnet_id                   = aws_subnet.public-subnet-1.id
  user_data                   = file(var.install_cpanel)
  associate_public_ip_address = true
  tags = {
    Name = "tf-cpanel"
  }
}

resource "aws_security_group" "sg_allow_tf_cpanel" {
  name        = "allow_allow_tf_cpanel"
  description = "Allow SSH and cpanel inbound traffic"
  vpc_id      = aws_vpc.development-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
    from_port   = 2083
    to_port     = 2083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2087
    to_port     = 2087
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = [aws_vpc.development-vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
