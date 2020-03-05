variable "aws_region" {
  description = "The AWS region in which all resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "dl_bucket_prefix" {
  description = "The prefix for s3 buckets within data lake"
  type        = string
  default     = "com.bb.data"
}



