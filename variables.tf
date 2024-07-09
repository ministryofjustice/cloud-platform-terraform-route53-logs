variable "log_destination_type" {
  description = "s3 or cloudwatch"
  default = "s3"
}

variable "vpc_id" {
  description = "VPC ID for Route53 Resolver query logs source."
  default = ""
}

variable "is_enabled" {
  description = "switch to enable/disable the module, defaults to false"
  default = false
}

variable "bucket_name" {
  description = "Name of the S3 bucket to store query logs."
  default = "cloud-platform-route53-resolver-query-logs"
}