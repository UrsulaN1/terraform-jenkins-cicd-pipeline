# Terraform settings configuration
terraform {
  backend "s3" {
    bucket         = "webhook-state-file"
    key            = "envs/prod/terraform.tfstate"
    region         = "us-east-1"

    # For Terraform 1.10+, use native S3 locking (Recommended)
    use_lockfile   = true

    # For older versions, use DynamoDB for locking
    # dynamodb_table = "terraform-state-locking"
  }
}


# Provider configuration
provider "aws" {
  region = "us-east-1"
}


