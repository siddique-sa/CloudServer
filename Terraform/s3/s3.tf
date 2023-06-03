provider "aws" {
  region = "ap-south-1"
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
