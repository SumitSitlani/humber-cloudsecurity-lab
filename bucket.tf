resource "aws_s3_bucket" "lab_bucket" {
  bucket = var.bucket_name
}