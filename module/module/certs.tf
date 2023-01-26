
# # data "aws_acm_certificate" "acm_cert" {
# # #   count    = var.use_default_domain ? 0 : 1
# #   domain   = coalesce(var.acm_certificate_domain, "*.${var.hosted_zone}")
# #   provider = aws.aws_cloudfront
# #   //CloudFront uses certificates from US-EAST-1 region only
# #   statuses = [
# #     "ISSUED",
# #   ]
# # }
# resource "aws_acm_certificate" "cert" {
#   domain_name       = var.acm_certificate_domain
#   validation_method = "DNS"

#   tags = {
#     Environment = "test"
#   }

#   lifecycle {
#     create_before_destroy = true
#   }
# }