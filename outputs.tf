output "s3_bucket_arn" {
  description = "s3 bucket arn"
  value = var.is_enabled ? module.s3_bucket_query_log[0].s3_bucket_arn : null
}

output "s3_bucket_id" {
  description = "s3 bucket id"
  value = var.is_enabled ? module.s3_bucket_query_log[0].s3_bucket_id : null
}