resource "aws_cloudfront_origin_access_control" "s3_oac" {
  name                              = "s3_oac_single_page_app"
  description                       = "OAC for S3 access"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  enabled = true
  comment = "Single Page App"

  origin {
    domain_name              = aws_s3_bucket.html_bucket.bucket_regional_domain_name
    origin_id                = var.s3_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_oac.id
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
    target_origin_id       = var.s3_origin_id
    viewer_protocol_policy = "https-only"

    # lambda_function_association {
    #   event_type = "viewer-request"
    #   lambda_arn = aws_lambda_function.lambda_function.qualified_arn
    # }
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["AU"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
