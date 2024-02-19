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
  
  # Other bucket configurations...

  # Define an access control policy
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Deny",
        Principal = "*",
        Action   = "*",
        Resource = "arn:aws:s3:::${aws_s3_bucket.test_bucket.bucket}/*",
      },
    ],
  })
}
