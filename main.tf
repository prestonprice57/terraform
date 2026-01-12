resource "aws_s3_bucket" "test_a2aJdvb9QZ9zbjvF" {
  bucket = "test"
}

resource "aws_s3_bucket_public_access_block" "test_a2aJdvb9QZ9zbjvF" {
  bucket = aws_s3_bucket.test_a2aJdvb9QZ9zbjvF.id

  block_public_acls       = false
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_ownership_controls" "test_a2aJdvb9QZ9zbjvF" {
  bucket = aws_s3_bucket.test_a2aJdvb9QZ9zbjvF.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "test_a2aJdvb9QZ9zbjvF" {
  bucket = aws_s3_bucket.test_a2aJdvb9QZ9zbjvF.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "test_a2aJdvb9QZ9zbjvF" {
  bucket = aws_s3_bucket.test_a2aJdvb9QZ9zbjvF.id

  rule {
    id = "transition-to-glacier"
    filter {}
    status = "Enabled"
    transition {
      days          = 11
      storage_class = "GLACIER"
    }
  }

  rule {
    id = "abort-multipart-upload"
    filter {}
    status = "Enabled"
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}
