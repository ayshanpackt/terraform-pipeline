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
	#variables.tf
variable "aws_region" {
  description = "The AWS region for our resources."
  type        = string
  default     = "us-east-1"
}

variable "random_suffix" {
  description = "A random suffix to ensure the bucket name is unique."
  type        = string
}[
