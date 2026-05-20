# Resources = Bucket resource
resource "aws_s3_bucket" "ln_dev_bucket" {
  bucket = "ln-dev-bucket"
  tags = {
    Environment = "dev"
    CostCenter  = "cc590"
  }
}

