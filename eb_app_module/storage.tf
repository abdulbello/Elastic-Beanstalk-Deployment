resource "aws_s3_bucket" "app_version_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_object" "bucket_object" {
  bucket = aws_s3_bucket.app_version_bucket.id
  key    = aws_s3_bucket.app_version_bucket.id
  source = var.bucket_local_file_source
}