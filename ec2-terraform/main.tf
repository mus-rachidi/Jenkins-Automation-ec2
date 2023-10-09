resource "aws_instance" "example" {
  ami           = "ami-06935448000742e6b"   # Replace with the desired AMI ID
  instance_type = "t2.micro"                 # Replace with the desired instance type
  key_name = var.KEY_NAME
  tags = {
    Name = var.TAGE_NAME
  }
  # associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.example.id]  # Provide the security group ID here
}

# resource "aws_eip" "example" {
#   instance = aws_instance.example.id
#   vpc      = true
# }

# resource "aws_eip_association" "example" {
#   instance_id   = aws_instance.example.id
#   allocation_id = aws_eip.example.id
# }

resource "aws_security_group" "example" {
  name        = "ec2-security-group"
  description = "allow http https 8080"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow SSH traffic from anywhere
  }

    ingress {
    from_port   = var.PORT_JENKINS
    to_port     = var.PORT_JENKINS
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow SSH traffic from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow HTTP traffic from anywhere
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Allow HTTPS traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public_ip" {
  value = aws_instance.example.public_ip
  
}
