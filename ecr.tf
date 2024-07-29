resource "aws_ecr_repository" "lambda_repo" {
  name = "s3-event-handler-repository"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "s3-event-handler-repository"
  }
}
