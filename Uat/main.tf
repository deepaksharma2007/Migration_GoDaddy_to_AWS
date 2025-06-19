# Create Security Group allow port 80 and ssh  
resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.main.id

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

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-security-group"
  }
}

# Enable SSM :- Create IAM role 
resource "aws_iam_role" "ssm_role" {
  name = "ssm-role_uat"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Enable SSM :- attached required permission with above Role 
resource "aws_iam_policy_attachment" "ssm_attach" {
  name       = "ssm-policy-attachment"
  roles      = [aws_iam_role.ssm_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Create instance profile 
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-instance-profile_uat"
  role = aws_iam_role.ssm_role.name
}

# Launch EC2 instance in public Subnet 
resource "aws_instance" "public_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.mypublic.id
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  vpc_security_group_ids = [aws_security_group.public_sg.id]
   key_name = var.key_name

  tags = {
    Name = var.ec2_instance_name
  }
}
