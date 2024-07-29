resource "aws_lambda_function" "s3_event_handler" {
  function_name = "s3_event_handler"
  role          = aws_iam_role.lambda_role.arn
  image_uri     = "${aws_ecr_repository.lambda_repo.repository_url}:${var.s3_to_db_lambda_version}"
  package_type = "Image"
  timeout      = 500

    environment {
      variables = {
        DB_HOST     = "rds-postgres-db.cygolagczlxlefefegr.eu-north-1.rds.amazonaws.com"
        DB_NAME     = "test-db"
        DB_USER     = "mytestdbuser"
        DB_PASSWORD = "Mypa$$w0rd123"
        DB_PORT     = "5432"
      }
    }

  vpc_config {
    subnet_ids         = [aws_subnet.sb-private-1.id, aws_subnet.sb-private-2.id, aws_subnet.sb-private-3.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }
}


resource "aws_lambda_permission" "allow_s3_invoke" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_event_handler.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.existing_bucket.arn
}
