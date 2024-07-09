provider "aws" {
  region = "eu-west-2"
}

module "route_53_query_logs" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-route53-logs?ref=[version]"
  
  is_enabled = true
  vpc_id = module.vpc.vpc_id
}
