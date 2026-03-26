resource "aws_s3_bucket" "html_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "html_bucket_sse" {
  bucket = aws_s3_bucket.html_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
