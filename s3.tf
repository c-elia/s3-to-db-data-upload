# resource "aws_s3_bucket" "data_bucket" {
#   bucket = var.terraform_bucket

#   tags = {
#     Name = var.terraform_bucket
#   }
# }

# change this to some other bucket after testing that it all works

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = data.aws_s3_bucket.existing_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_event_handler.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "data/"
  }
}
