# cloud-platform-terraform-route-53-logs

[![Releases](https://img.shields.io/github/v/release/ministryofjustice/cloud-platform-terraform-template.svg)](https://github.com/ministryofjustice/cloud-platform-terraform-template/releases)

This Terraform module manages logging of Route53 DNS queries, via Route53 Resolver Query logging. Logs are stored in S3.

## Usage

```hcl
module "route53_query_logs" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-route53-logs?ref=version" # use the latest release

  is_enabled  = true
  vpc_id      = "my-vpc"
  bucket_name = "my-bucket-name"
}
```

See the [examples/](examples/) folder for more information.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket_query_log"></a> [s3\_bucket\_query\_log](#module\_s3\_bucket\_query\_log) | terraform-aws-modules/s3-bucket/aws | 3.15.1 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_resolver_query_log_config.query_log_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config) | resource |
| [aws_route53_resolver_query_log_config_association.query_log_config_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_query_log_config_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket to store query logs. | `string` | `"cloud-platform-route53-resolver-query-logs"` | no |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | switch to enable/disable the module, defaults to false | `bool` | `false` | no |
| <a name="input_log_destination_type"></a> [log\_destination\_type](#input\_log\_destination\_type) | Where to store resolver logs. Currently we're only using S3 | `string` | `"s3"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID for Route53 Resolver query logs source. | `string` | `""` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name will be appended to bucket name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | s3 bucket arn |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | s3 bucket id |
<!-- END_TF_DOCS -->

## Tags

Some of the inputs for this module are tags. All infrastructure resources must be tagged to meet the MOJ Technical Guidance on [Documenting owners of infrastructure](https://technical-guidance.service.justice.gov.uk/documentation/standards/documenting-infrastructure-owners.html).

You should use your namespace variables to populate these. See the [Usage](#usage) section for more information.

## Reading Material

<!-- Add links to useful documentation -->

- [Cloud Platform user guide](https://user-guide.cloud-platform.service.justice.gov.uk/#cloud-platform-user-guide)
