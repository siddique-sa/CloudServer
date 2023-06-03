provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "mys3" {
  bucket = "self-state-storage"
  acl    = "public"

  versioning {
    enabled = true
  }
  tags = {
    Name = "My self-state-storage Bucket"
  }
}

# Configure backend S3 bucket after its creation
data "terraform_remote_state" "backend_config" {
  backend = "s3"
  config = {
    bucket = aws_s3_bucket.mys3.id
    key    = "s3/terraform.tfstate"
    region = "ap-south-1"  
  }
}