## backend data for terraform
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
  organization = "cloudquickpoc"

    workspaces {
      name = "AWS-CloudQuickPocs"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#module "BackupIAM" {
#  source = "./BackupIAM"
#}

#module "BackupInfra" {
#  source = "./BackupInfra"
#  depends_on = [module.BackupIAM]
#}

# Step 1 - Resource block for EC2 instance
resource "aws_instance" "ec2_example" {

  ami                    = "ami-0767046d1677be5a0"
  instance_type          = "t2.micro"
  key_name               = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]
}

# Step 2 - Resource block for Security Group
resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0",]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0",]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}

# Step 3 - Set up the SSH key pair
# To generate SSH key refer to - https://jhooq.com/terraform-generate-ssh-key
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "<PLACE-YOUR-PUBLIC-KEY>"
}
