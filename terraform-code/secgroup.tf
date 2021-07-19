resource "aws_security_group" "Demo" {
  name = "Demo-SG-v1"
  tags {
        Name = "Demo-SG-v1"
  }
  description = "Demo SG v1"
  egress {
    from_port   = 0
    to_port     = 65535 # All outbound traffic
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     from_port   = 80
     to_port     = 80 # All outbound traffic
     protocol    = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "Demo-2" {
  name = "Demo-SG-v2"
  tags {
        Name = "Demo-SG-v2"
  }
  description = "Demo SG v2"
  egress {
    from_port   = 0
    to_port     = 65535 # All outbound traffic
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     from_port   = 443
     to_port     = 443 # All outbound traffic
     protocol    = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
    }
}
