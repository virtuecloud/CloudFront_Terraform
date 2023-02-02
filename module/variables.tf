/* variable "domain_name" {
  description = "domain name (or application name if no domain name available)"
} */
variable "bucket_name"{
  description = "Name of the bucket"
}
/* 
variable "cert_arn"{
  description = "arn of certificate to be used"
} */
variable "tags" {
  type        = map(string)
  description = "tags for all the resources, if any"
}

/* variable "hosted_zone" {
  default     = null
  description = "Route53 hosted zone"
} */

/* variable "acm_certificate_domain" {
  default     = null
  description = "Domain of the ACM certificate"
} */

variable "price_class" {
  description = "CloudFront distribution price class"
}

/* variable "use_default_domain" {
  default     = false
  description = "Use CloudFront website address without Route53 and ACM certificate"
} */

variable "upload_sample_file" {
  description = "Upload sample html file to s3 bucket"
}

# All values for the TTL are important when uploading static content that changes
variable "cloudfront_min_ttl" {
  description = "The minimum TTL for the cloudfront cache"
}

variable "cloudfront_default_ttl" {
  description = "The default TTL for the cloudfront cache"
}

variable "cloudfront_max_ttl" {
  description = "The maximum TTL for the cloudfront cache"
}
variable "bucketcreation" {
  type = string 
 }

variable "cloudfront_geo_restriction_restriction_type" {
  description = "The method that you want to use to restrict distribution of your content by country: none, whitelist, or blacklist."
  validation {
    error_message = "Can only specify either none, whitelist, blacklist"
    condition     = can(regex("^(none|whitelist|blacklist)$", var.cloudfront_geo_restriction_restriction_type))
  }

}

# variable "cloudfront_geo_restriction_locations" {
#   default     = []
#   description = "The ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)."
#   validation {
#     error_message = "must be a valid ISO 3166-1-alpha-2 code"
#     condition     = length(var.cloudfront_geo_restriction_locations) == 2
#   }

# }
# variable "route_name" {
  
# }
