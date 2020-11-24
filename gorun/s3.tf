provider "aws" {
  region = "ap-southeast-1"
}

module "s3_bucket" {
  source                  = "devops4mecode/s3/aws"
  version                 = "1.2.0"
  name                    = "logging-bucket"
  application             = "devops4me"
  environment             = "test"
  label_order             = ["environment", "application", "name"]
  versioning              = true
  acl                     = "private"
  bucket_logging_enabled  = true
  target_bucket           = "bucket-logs12"
  target_prefix           = "logs"
}