output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "repository_url" {
  value = aws_ecr_repository.lambda_repo.repository_url
}

output "db_url" {
  value = aws_db_instance.database.endpoint
}

