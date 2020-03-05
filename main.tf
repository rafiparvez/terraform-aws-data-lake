provider "aws" {
  # The AWS region in which all resources will be created
  region = var.aws_region

  # Provider version 2.X series is the latest, but has breaking changes with 1.X series.
  version = "~> 2.6"

}
# restrict public access to buckets and objects
resource "aws_s3_account_public_access_block" "block_s3_bucket_public_access" {
  restrict_public_buckets = true
  ignore_public_acls      = true
  block_public_acls       = true
  block_public_policy     = true
}

# Create buckets for data lake
resource "aws_s3_bucket" "landing_zone_bucket" {
  bucket = "${var.dl_bucket_prefix}.landing"
  acl    = "private"
}

resource "aws_s3_bucket" "refined_zone_bucket" {
  bucket = "${var.dl_bucket_prefix}.refined"
  acl    = "private"
}

resource "aws_s3_bucket" "project_zone_bucket" {
  bucket = "${var.dl_bucket_prefix}.project"
  acl    = "private"
}
