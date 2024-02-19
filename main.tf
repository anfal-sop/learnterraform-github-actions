terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"
  
  # Define an access control policy
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Principal = "*",
        Action   = "*",
        Resource = "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*",
      },
    ],
  })
}
