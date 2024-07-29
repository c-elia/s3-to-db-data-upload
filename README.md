# s3-to-db-data-upload

This is a project that uploads a dummy excel or csv file to an RDS postgres database using an RDS Lambda

## Pre-Requisites


An existing AWS bucket to store the state and a prefix named **data** where the data in S3 will be uploaded.
Existing credentials stored in AWS Secrets Manager

### Initializing the project

```console
terraform init
```

### Printing the expected result

```console
terraform plan
```

### Provisioning everything in AWS

```console
terraform apply
```