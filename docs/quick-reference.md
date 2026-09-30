# Quick reference

## AWS

```bash
aws sts get-caller-identity
aws eks update-kubeconfig --region ap-south-1 --name niranjan-eks
```

## Terraform backend

```bash
cd terraform/bootstrap
terraform init
terraform apply
```

## Terraform EKS

```bash
cd ../eks
cp terraform.tfvars.example terraform.tfvars
terraform init -backend-config="bucket=<BOOTSTRAP_BUCKET>" -backend-config="dynamodb_table=niranjan-devops-tf-lock"
terraform apply
```

## Kubernetes

```bash
kubectl get nodes
kubectl get pods -A
kubectl get all -n devops
kubectl get ingress -n devops
kubectl rollout status deployment/devops-app -n devops
```

## Manual application deployment

```bash
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

## GitHub Actions

Required repository secrets:

```text
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
AWS_GITHUB_ACTIONS_ROLE_ARN
```

The workflow builds the image, pushes it to Docker Hub, updates the Kubernetes image tag, authenticates to AWS through OIDC, and deploys directly to EKS with `kubectl`.
