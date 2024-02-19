provider "aws" {
  region  = "us-west-1"
  version = "~> 4.0"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"
}
