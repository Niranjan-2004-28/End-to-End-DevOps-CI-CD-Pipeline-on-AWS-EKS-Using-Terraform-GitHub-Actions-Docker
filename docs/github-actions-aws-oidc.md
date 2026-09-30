# GitHub Actions AWS OIDC

This project uses GitHub Actions OpenID Connect (OIDC) instead of long-lived AWS access keys.

Terraform creates:

- A GitHub Actions OIDC identity provider.
- An IAM role trusted only by the configured GitHub repository and `main` branch.
- An EKS access entry for the GitHub Actions role.
- An EKS access policy association so the workflow can deploy Kubernetes resources.

The workflow requests a short-lived AWS session and then runs:

```bash
aws eks update-kubeconfig --region ap-south-1 --name niranjan-eks
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
```

Required GitHub repository secrets:

```text
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
AWS_GITHUB_ACTIONS_ROLE_ARN
```

Get the role ARN after Terraform completes:

```bash
terraform output github_actions_role_arn
```

> For production, replace broad demo permissions with the smallest EKS and Kubernetes permissions required by your deployment process.
