# terraform-s3-state-bucket
Terraform Code to setup a state s3 bucket with a DynamoDB locking table

```bash
terraform init
terraform apply
```

Assumed to be executed under a profile context with appropriate access rights.

To cleanup delete all objects in the S3 Bucket first and then run...

```bash
terraform destroy
```