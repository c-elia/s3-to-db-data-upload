variable "terraform_bucket" {
  description = "The bucket that stores the terraform state"
  type        = string
  default     = "elia-test-lms"
}

variable "terraform_key" {
  description = "The key that stores the terraform state"
  type        = string
  default     = "elia-test-lms/terraform.tfstate"

}

variable "region" {
  description = "The region where the resources will be deployed"
  type        = string
  default     = "eu-north-1"
}


variable "vpc_name" {
  description = "Vpc name"
  type        = string
  default     = "main-vpc"
}

variable "cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = map(string)
  default = {
    "sb-private-1" = "10.0.1.0/24"
    "sb-private-2" = "10.0.2.0/24"
    "sb-private-3" = "10.0.3.0/24"
  }
}


variable "db_port" {
  description = "Database port value"
  type        = string
  default     = "5432"
}


variable "database" {
  description = "Database configs for the RDS db"
  type        = map(string)
  default = {
    name                       = "rds-postgres-db"
    port                       = 5432
    allocated_storage          = 20
    max_allocated_storage      = 500
    instance_class             = "db.t3.micro"
    storage_type               = "gp2"
    multi_az                   = false
    publicly_accessible        = false
    engine_version             = "14"
    backup_retention_period    = 30
    family                     = "postgres14"
    log_min_duration_statement = "0"
    log_duration               = "1"
    rds_log_retention_period   = "1440"
  }
}


variable "public_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = map(string)
  default = {
    "sb-public-1" = "10.0.16.0/24"
    "sb-public-2" = "10.0.32.0/24"
    "sb-public-3" = "10.0.64.0/24"
  }
}


variable "s3_to_db_lambda_version" {
  type = string
  default = "v1"
}