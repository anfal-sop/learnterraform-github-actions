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


