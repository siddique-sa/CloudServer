provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "mys3" {
  bucket = "self-state-storage"
  acl    = "public"

  versioning {
    enabled = true
  }
}

terraform {
  backend "s3" {
    bucket = aws_s3_bucket.mys3.bucket
    key    = "s3/terraform.tfstate"
    egion = "ap-south-1"
  }
}
