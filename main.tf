module "cloudfront_with_s3" {
  source      = "./module"
  bucket_name = var.bucket_name
  cloudfront_min_ttl                          = var.cloudfront_min_ttl
  cloudfront_default_ttl                      = var.cloudfront_default_ttl
  cloudfront_max_ttl                          = var.cloudfront_max_ttl
  price_class                                 = var.price_class
  upload_sample_file                          = var.upload_sample_file
  tags                                        = var.tags
  cloudfront_geo_restriction_restriction_type = var.cloudfront_geo_restriction_restriction_type
  /* use_default_domain = "dev.entana.net" */
  /* acm_certificate_domain = "dev.entana.net" */
  /* hosted_zone = "Z01684972SYKLONH5OMKA" */
  /* domain_name = "*.fonemedhms.com"
  
  cert_arn = "arn:aws:acm:ca-central-1:075687657552:certificate/546f6e8c-ffac-4e08-a749-65726311cc22" */
  # route_name ="cloudfront2.dev.entana.net"

}

# locals {
#   default_certs = var.use_default_domain ? ["default"] : []
#   acm_certs     = var.use_default_domain ? [] : ["acm"]
#   domain_name   = var.use_default_domain ? [] : [var.domain_name]
# }





