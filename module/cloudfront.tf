
resource "aws_cloudfront_distribution" "s3_distribution" {
  depends_on = [
    aws_s3_bucket.s3_bucket
  ]


  origin {
    domain_name = var.bucket_name
    origin_id   = "s3-cloudfront"

    /* s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    } */
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
/* 
  aliases = [var.domain_name] */

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
    ]

    cached_methods = [
      "GET",
      "HEAD",
    ]

    target_origin_id = "s3-cloudfront"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"

    min_ttl     = var.cloudfront_min_ttl
    default_ttl = var.cloudfront_default_ttl
    max_ttl     = var.cloudfront_max_ttl
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = var.cloudfront_geo_restriction_restriction_type
      locations = []
    }
  }
  

    viewer_certificate {
    
      /* acm_certificate_arn      = var.cert_arn     #data.aws_acm_certificate.acm_cert.arn */
      ssl_support_method       = "sni-only"
      minimum_protocol_version = "TLSv1"
      cloudfront_default_certificate = true
    
   }

  custom_error_response {
    error_code            = 403
    response_code         = 200
    error_caching_min_ttl = 0
    response_page_path    = "/index.html"
  }
  custom_error_response {
    error_code            = 404
    response_code         = 200
    error_caching_min_ttl = 0
    response_page_path    = "/index.html"
  }

  wait_for_deployment = false
  tags                = var.tags
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  count = var.bucketcreation ? 1 : 0
  comment = "access-identity-${var.bucket_name}.s3.amazonaws.com"
}
