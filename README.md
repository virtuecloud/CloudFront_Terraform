# CloudFront_Terraform
Terraform module which creates AWS CloudFront resources with all (or almost all) features provided by Terraform AWS provider.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.29 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |


Module Input Variables
----------------------
  |Name                 | Description |                  type |
  | -------------                  | ------------- | -----------------|
| bucket_name                  | bucket name|string|
| bucket_creation        | Is it required to create a bucket or not | boolean|
| cloudfront_min_ttl        |  cloudfront minimum ttl value | string|
| cloudfront_default_ttl        |  cloudfront default ttl value|string|
| cloudfront_max_ttl        |  cloudfront maximum ttl value| string|
| price_class        | price_class of the terrafrom | string |
| upload_sample_file        | to upload a file on cloudfront |boolean|
| tags       | tags for cloudfront|map
| cloudfront_geo_restriction_restriction_type     | to block domain access on specified regions(like countries)|string|
| cert_arn      | larn of existing ssl certificate | string|


Usage
-----

```hcl
module "cloudfront_with_s3" {
  source = "git::https://github.com/virtuecloud/CloudFront_Terraform.git//module"
  bucket_name = var.bucket_name
  bucketcreation = var.bucketcreation
  cloudfront_min_ttl = var.cloudfront_min_ttl
  cloudfront_default_ttl = var.cloudfront_default_ttl
  cloudfront_max_ttl = var.cloudfront_max_ttl
  price_class = var.price_class
  upload_sample_file = var.upload_sample_file
  tags = var.tags
  cloudfront_geo_restriction_restriction_type = var.cloudfront_geo_restriction_restriction_type
  /* use_default_domain = "dev.example.net" */
  /* acm_certificate_domain = "dev.example.net" */
  /* hosted_zone = "Z01684972SYKLONH5OMKA" */
  /* domain_name = "*.fonemedhms.com"
  
  cert_arn = "arn:aws:acm:ca-central-1:075687657552:certificate/546f6e8c-ffac-4e08-a749-65726311cc22" */
  # route_name ="cloudfront2.dev.example.net"
  
}

```

## Resources

| Name | Type |
|------|------|
|[aws_cloudfront_distribution_s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution)|resource|
|[aws_route53_record_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record)|resource|
|[aws_s3_bucket_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)| resource|

Outputs
=======
|Name | Description|
|-----|------------|
|cloudfront_domain| cloudfront domain  |
 |s3_bucket_name| s3_bucket_name |


Authors
=======

virtuecloud.io
