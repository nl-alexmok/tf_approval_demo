resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-demo-main-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "terraform-demo-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "terraform-demo-public-rt"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "terraform-demo-public-a"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-demo-ec2-sg"
  }
}

resource "aws_instance" "demo_ec2" {
  ami                         = "ami-0dc2d3e4c0f9ebd18"
  instance_type               = "t3.nano"
  key_name                    = "alex-key"
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.public_a.id}"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]

  root_block_device {
      encrypted   = true
      volume_size = "20"
  }

  tags = {
    Name = "terraform-demo-ec2"
  }
}
