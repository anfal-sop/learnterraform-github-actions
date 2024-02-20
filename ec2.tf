# Step 1 - Resource block for EC2 instance
resource "aws_instance" "ec2_example" {
  ami                    = "ami-0440d3b780d96b29d"
  instance_type          = "t2.micro"
}

