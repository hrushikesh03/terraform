provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAU2KZILZSMG6VIQV2"
  secret_key = "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"
  region     = "ap-south-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-terraform-test-bucket-khgjhk"
  acl    = "private"
  tags = {
    Name        = "my bucket"
    Environment = "Test"
  }
}
