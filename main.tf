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

resource "aws_s3_bucket" "bucket" {
  bucket = "my_tfstate_bucket"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  
  # Deny non-https request policy
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "ForceSSLOnlyAccess"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource  = "arn:aws:s3:::my_tfstate_bucket/*"
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      },
    ]
  })
}

