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
  ami                    = "ami-0440d3b780d96b29d"
  instance_type          = "t2.micro"
  region                 = "us-east-1"
}

