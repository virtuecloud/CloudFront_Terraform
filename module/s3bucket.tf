resource "aws_s3_bucket" "s3_bucket" {
  count = var.bucketcreation ? 1 : 0
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = var.bucket_name
  count = var.bucketcreation  ? 1 : 0
  policy = data.aws_iam_policy_document.s3_bucket_policy[count.index].json
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket[count.index].id

  count = var.bucketcreation ? 1 : 0
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  count = var.bucketcreation ? 1 : 0
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = var.bucket_name
  count = var.bucketcreation ? 1 : 0

  versioning_configuration {
    status = "Enabled"
    //count = var.bucketcreation == true ? 1 : 0
  }
}

resource "aws_s3_object" "object" {
  count        = var.upload_sample_file ? 1 : 0
  bucket       = aws_s3_bucket.s3_bucket[count.index].bucket
  key          = "index.html"
  source       = "${path.module}/index.html"
  content_type = "text/html"
  etag         = filemd5("${path.module}/index.html")
 
}
resource "aws_s3_object" "errorobject" {
  count        = var.upload_sample_file ? 1 : 0
  bucket       = aws_s3_bucket.s3_bucket[count.index].bucket
  key          = "error.html"
  source       = "${path.module}/error.html"
  content_type = "text/html"
  etag         = filemd5("${path.module}/error.html")
}
