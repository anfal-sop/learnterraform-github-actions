terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"
}
