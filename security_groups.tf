# Database Security Group
resource "aws_security_group" "db-sg" {
  name        = "db-sg"
  vpc_id      = aws_vpc.vpc.id
  description = "Allow access from Lambda to RDS instance"

  ingress {
    description     = "Access from Lambda"
    protocol        = "tcp"
    from_port       = var.db_port
    to_port         = var.db_port
    security_groups = [aws_security_group.lambda_sg.id]
  }

  ingress {
    description = "Access from VPC"
    protocol    = "tcp"
    from_port   = var.db_port
    to_port     = var.db_port
    cidr_blocks = [aws_subnet.sb-private-1.cidr_block, aws_subnet.sb-private-2.cidr_block, aws_subnet.sb-private-3.cidr_block]
  }

  egress {
    description      = "Egress traffic from RDS instance"
    protocol         = "-1"
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"] #tfsec:ignore:aws-vpc-no-public-egress-sgr
    ipv6_cidr_blocks = ["::/0"]      #tfsec:ignore:aws-vpc-no-public-egress-sgr
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }

}



resource "aws_security_group" "lambda_sg" {
  name        = "lambda-sg"
  description = "Allow Lambda to access RDS"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.db-sg.id]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lambda-sg"
  }
}
