provider "aws" {
  # The AWS region in which all resources will be created
  region = var.aws_region

  # Provider version 2.X series is the latest, but has breaking changes with 1.X series.
  version = "~> 2.6"

}

# Create buckets for data lake
resource "aws_s3_bucket" "data_lake_bucket" {
  count  = "${length(var.s3_bucket_name)}"
  bucket = "${var.s3_bucket_name[count.index]}"
  acl    = "private"
}
# Restrict public access to buckets and objects
resource "aws_s3_bucket_public_access_block" "block_s3_bucket_public_access" {
  count                   = "${length(var.s3_bucket_name)}"
  bucket                  = "${var.s3_bucket_name[count.index]}"
  restrict_public_buckets = true
  ignore_public_acls      = true
  block_public_acls       = true
  block_public_policy     = true
}
