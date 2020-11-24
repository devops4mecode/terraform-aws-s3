provider "aws" {
  region = "ap-southeast-1"
}

module "s3_bucket" {
  source                  = "devops4mecode/s3/aws"
  version                 = "1.4.0"
  name                    = "s3bucket"
  application             = "devops4me"
  environment             = "test"
  label_order             = ["environment", "application", "name"]
  versioning              = true
  acl                     = "private"
  bucket_logging_enabled  = true
  target_bucket           = "do4m-bucket-logs"
  target_prefix           = "logs"
}