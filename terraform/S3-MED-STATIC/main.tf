provider "aws" {
    region = "us-east-2"
}

variable "bucket_name" {
    type = string
}

resources "aws_s3_bucket" "static_site_bucket" {
    bucket = "static-site-${var.bucket_name}"

    website {
        index_document = "index.html"
        error_document = "error.html"

    }

    tags = {
        name = "Static site Bucket"
        Environment = "Production"
    }
}


resources "aws_s3_bucket_public_access_block" "static_site_bucket" {
    bucket = aws_s3_bucket.static_site_bucket.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

