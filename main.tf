locals {
  bucket_name = "my-bucket"
  versioning  = "Enabled"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = local.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket_encryption" {
    bucket = aws_s3_bucket.terraform_state.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}

resource "aws_s3_bucket_versioning" "state_bucket_versioining" {
    bucket = aws_s3_bucket.terraform_state.id

    versioning_configuration {
        status = local.versioning
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name         = "${local.bucket_name}-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}