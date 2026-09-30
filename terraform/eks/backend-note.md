# Backend note

The main stack uses an S3 backend and DynamoDB for state locking. Run the bootstrap stack first and then initialize the EKS stack with:

```bash
terraform init \
  -backend-config="bucket=<BOOTSTRAP_BUCKET_NAME>" \
  -backend-config="dynamodb_table=<BOOTSTRAP_LOCK_TABLE_NAME>"
```

The backend key is `eks/terraform.tfstate`.
