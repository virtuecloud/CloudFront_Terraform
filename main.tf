module "cloudfront_with_s3" {
  source = "./module"
  bucket_name = "jklmsadkankcj-dev"
  /* use_default_domain = "dev.entana.net" */
  /* acm_certificate_domain = "dev.entana.net" */
  hosted_zone = "Z01684972SYKLONH5OMKA"
  domain_name = "*.dev.entana.net"
  cert_arn = "arn:aws:acm:us-east-1:342214740201:certificate/0d61fa72-58fd-4914-8b99-6c92978d1d3d"
  # route_name ="cloudfront2.dev.entana.net"
  
}

# locals {
#   default_certs = var.use_default_domain ? ["default"] : []
#   acm_certs     = var.use_default_domain ? [] : ["acm"]
#   domain_name   = var.use_default_domain ? [] : [var.domain_name]
# }





