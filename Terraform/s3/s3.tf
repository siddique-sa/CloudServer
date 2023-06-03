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
    bucket = aws_s3_bucket.mys3.id
    key    = "s3/terraform.tfstate"
    region = "ap-south-1"
  }
}
