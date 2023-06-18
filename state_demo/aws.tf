terraform {
    backend "s3" {
        bucket = "my-bucket"
        key    = "my-bucket/terraform.tfstate"
        profile = "aws_terraform"
        region = "eu-central-1"

        dynamodb_table = "my-bucket-state-locks"
        encrypt        = true
    }
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.38.0"
        }
    }
}

provider "aws" {
    region  = "eu-central-1"
    profile = "aws_terraform"
}