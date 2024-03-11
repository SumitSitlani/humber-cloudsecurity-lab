output "ipaddress" {
  value = aws_instance.lab_instance.public_ip
}

output "s3bucket" {
  value = aws_s3_bucket.lab_bucket.bucket_domain_name
}