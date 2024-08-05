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


### Lambda

To deploy the lambda image run the commands below

- Create a variable to store the image tag version

    `export TAG=v1.0`

- Login to ECR

    `aws ecr get-login-password --region <aws-region> | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com`

- Build the image

    `docker build --platform linux/amd64 -t <repository-name>:$TAG .`

- Tag the image that will be pushed

    `docker tag <repository-name>:$TAG <aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com/<repository-name>:$TAG`

- Push the image

    `docker push <aws-account-id>.dkr.ecr.<aws-region>.amazonaws.com/<repository-name>:$TAG`