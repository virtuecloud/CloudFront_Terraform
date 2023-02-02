data "aws_iam_policy_document" "s3_bucket_policy" {
 count = var.bucketcreation ? 1 : 0
  statement {
    sid = "1"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
    ]

    principals {
      type = "AWS"

      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity[count.index].iam_arn,
      ]
    }
  }
}
