data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "ubuntu" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.ubuntu_sg.id]
  associate_public_ip_address = true

  subnet_id = aws_subnet.subnet.id

  tags = {
    Name = "Ubuntu-EC2"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    echo "<html><h1>Hello World</h1><p>$(lsb_release -a)</p></html>" > /var/www/html/index.html
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
  EOF
}

resource "aws_instance" "amazon_linux_instance" {
  ami             = data.aws_ami.amazon_linux.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.amazon_linux_sg.id]
  key_name        = var.key_pair_name

  tags = {
    Name = "Amazon-Linux-Instance"
  }
}