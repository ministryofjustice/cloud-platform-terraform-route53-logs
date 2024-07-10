provider "aws" {
  region = "eu-west-2"
}

module "route_53_query_logs" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-route53-logs?ref=1.0.0"
  
  is_enabled = true
  vpc_id = "my-vpc-id"
  bucket_name = "${var.bucket_name}-${var.vpc_name}"
}
