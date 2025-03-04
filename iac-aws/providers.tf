terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.89.0"
    }
  }

  backend "s3" {
    bucket  = "devops-bucket-state-tf"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true

    profile = "bhdev-sso"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "bhdev-sso"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_state

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.terraform_state
    ]

}