resource "aws_key_pair" "security_lab_key" {
  key_name   = "security_lab_key"
  public_key = file(var.public_key)
}

resource "aws_security_group" "lab_sg" {
  name        = "security_lab_sg"
  description = "Allow SSH from anywhere"
  vpc_id      = aws_vpc.security_lab_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "lab_instance" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.security_lab_key.key_name
  subnet_id            = aws_subnet.security_lab_subnet.id
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  tags = {
    Name = "Lab_Instance_for_S3"
  }
}