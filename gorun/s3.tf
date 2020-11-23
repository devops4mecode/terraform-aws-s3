provider "aws" {
  region = "ap-southeast-1"
}

module "s3_bucket" {
  source = "./../../"

  name           = "secure-bucket"
  application    = "devops4me"
  environment    = "test"
  label_order    = ["environment", "application", "name"]
  versioning     = true
  acl            = "private"
  bucket_enabled = true
}