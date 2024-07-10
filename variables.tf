variable "log_destination_type" {
  description = "Where to store resolver logs. Currently we're only using S3"
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

variable "vpc_name" {
  description = "VPC name will be appended to bucket name"
  default = ""
}