terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "staging_bucket" {
  bucket = "my-staging-bucket-${var.random_suffix}"

  tags = {
    Name        = "Staging Bucket"
    ManagedBy   = "Terraform via GitHub Actions"
  }
}
