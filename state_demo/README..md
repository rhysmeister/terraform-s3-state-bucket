This sub directory contains a little demo project that uses the S3 state bucket setup above.

Be sure to change the settings in the terraform s3 backend if required.

```bash
terraform init
terraform apply
```

To cleanup...

```bash
terraform destroy
```