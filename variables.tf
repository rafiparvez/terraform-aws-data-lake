variable "aws_region" {
  description = "The AWS region in which all resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "The names of s3 buckets within data lake"
  type        = list
  default = [
    "com.birchbox.data.landing",
    "com.birchbox.data.refined",
    "com.birchbox.data.project"
  ]
}
