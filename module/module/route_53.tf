# # data "aws_route53_zone" "domain_name" {
# # #   count        = var.use_default_domain ? 0 : 1
# #   name         = var.hosted_zone
# #   private_zone = false
# # }





# ### ROUTE53 ###

# resource "aws_route53_record" "route53_record" {
# #   count      = var.use_default_domain ? 0 : 1
#   depends_on = [
#     aws_cloudfront_distribution.s3_distribution
#   ]

#   zone_id = var.hosted_zone                   #data.aws_route53_zone.domain_name.zone_id
#   name    = var.domain_name
#   type    = "A"

#   alias {
#     name    = aws_cloudfront_distribution.s3_distribution.domain_name
#     zone_id = var.hosted_zone

#     //HardCoded value for CloudFront
#     evaluate_target_health = false
#   }
# }