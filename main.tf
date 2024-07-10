module "s3_bucket_query_log" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"
  
  count = var.is_enabled ? 1 : 0

  bucket = "${var.bucket_name}-${var.vpc_name}"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_route53_resolver_query_log_config" "query_log_config" {
  count = var.is_enabled ? 1 : 0
  
  name = "query-log-config"  
  destination_arn = module.s3_bucket_query_log[count.index].s3_bucket_arn
}

resource "aws_route53_resolver_query_log_config_association" "query_log_config_association" {
  count = var.is_enabled ? 1 : 0
  
  resolver_query_log_config_id = aws_route53_resolver_query_log_config.query_log_config[count.index].id
  resource_id                  = var.vpc_id
}