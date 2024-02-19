provider "aws" {
  region  = "us-west-1"
  version = "~> 4.0"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"

  # Remove the 'acl' argument
  
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
