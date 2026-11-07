# E-Commerce Application – Infrastructure as Code & CI/CD

![AWS](https://img.shields.io/badge/Cloud-AWS-orange)
![Terraform](https://img.shields.io/badge/IaC-Terraform-purple)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-black)
![ECS](https://img.shields.io/badge/Deployment-Amazon%20ECS-orange)

## 1. Project Overview

This project demonstrates an end-to-end DevOps implementation of a containerized E-Commerce application on Amazon Web Services (AWS).

The infrastructure is provisioned using Terraform, the application is containerized using Docker, and CI/CD automation is implemented using GitHub Actions.

The application runs on Amazon ECS with AWS Fargate and is exposed to users through an Application Load Balancer.

**Project Repository:**  
https://github.com/saurabh4516/infra-as-code-pipeline

**AWS Region:** `ap-south-1` (Mumbai)

## 2. Project Objectives

- Automate AWS infrastructure provisioning using Terraform.
- Containerize the application using Docker.
- Store Docker images in Amazon ECR.
- Deploy the application using Amazon ECS and Fargate.
- Configure an Application Load Balancer.
- Implement CI/CD using GitHub Actions.
- Follow Infrastructure as Code best practices.
- Improve application deployment and infrastructure management.

## 3. Architecture

```text
             Developer
                 |
                 | Git Push
                 v
          GitHub Repository
                 |
                 v
          GitHub Actions
                 |
          Build Docker Image
                 |
                 v
             Amazon ECR
                 |
           Pull Docker Image
                 |
                 v
          Amazon ECS / Fargate
                 |
                 v
          Application Container
                 |
                 v
        Application Load Balancer
                 |
                 v
              End Users

        Terraform provisions AWS infrastructure
```

## 4. Technology Stack

| Technology | Purpose |
|---|---|
| AWS | Cloud infrastructure |
| Terraform | Infrastructure as Code |
| Docker | Application containerization |
| Amazon ECR | Docker image repository |
| Amazon ECS | Container orchestration |
| AWS Fargate | Serverless container execution |
| Application Load Balancer | Application traffic distribution |
| GitHub Actions | CI/CD automation |
| IAM | Access and permissions management |
| CloudWatch | Application and container logs |
| Git & GitHub | Version control |

## 5. AWS Services Used

### Amazon VPC
Provides an isolated networking environment for the application.

### Public and Private Subnets
- Public subnets host internet-facing resources.
- Private subnets host ECS application tasks.

### Internet Gateway
Provides internet connectivity to public subnets.

### NAT Gateway
Allows resources in private subnets to access external services.

### Application Load Balancer
Receives incoming HTTP requests and forwards traffic to healthy application targets.

### Amazon ECS with Fargate
Runs the containerized application without managing EC2 instances.

### Amazon ECR
Stores Docker images used by ECS tasks.

### IAM
Manages permissions for AWS resources and CI/CD automation.

## 6. Repository Structure

```text
infra-as-code-pipeline/
│
├── .github/
│   └── workflows/
│       └── CI/CD workflow files
│
├── app/
│   └── Application source code
│
├── terraform/
│   ├── environments/
│   │   └── Environment configuration
│   │
│   └── modules/
│       └── Reusable Terraform modules
│
├── .gitignore
└── README.md
```

## 7. Prerequisites

Before deploying the project, install:

- Git
- Terraform
- Docker
- AWS CLI
- AWS account
- GitHub account

Configure AWS CLI:

```bash
aws configure
```

Configure your AWS region:

```text
ap-south-1
```

Never upload AWS credentials, private keys, Terraform state files, or secrets to GitHub.

## 8. Deployment Steps

### Step 1: Clone the repository

```bash
git clone https://github.com/saurabh4516/infra-as-code-pipeline.git

cd infra-as-code-pipeline
```

### Step 2: Initialize Terraform

```bash
terraform -chdir=terraform/environments init
```

### Step 3: Format Terraform files

```bash
terraform -chdir=terraform/environments fmt -recursive
```

### Step 4: Validate Terraform configuration

```bash
terraform -chdir=terraform/environments validate
```

### Step 5: Review infrastructure changes

```bash
terraform -chdir=terraform/environments plan
```

### Step 6: Deploy AWS infrastructure

```bash
terraform -chdir=terraform/environments apply
```

Review the plan and confirm only when you are satisfied with the proposed resources and costs.

### Step 7: Build Docker image

Check the actual Dockerfile location and build context in the `app/` directory. For a Dockerfile at `app/Dockerfile`:

```bash
docker build -t ecommerce-app ./app
```

### Step 8: Verify deployment

Retrieve Terraform outputs:

```bash
terraform -chdir=terraform/environments output
```

Find the Application Load Balancer DNS name and open it in your browser:

```text
http://<ALB-DNS-NAME>
```

Replace the placeholder with your actual ALB DNS name.

## 9. CI/CD Pipeline

GitHub Actions is used to automate the application delivery process.

The intended pipeline flow is:

1. Developer pushes code to GitHub.
2. GitHub Actions starts the configured workflow.
3. Application source code is checked out.
4. Docker image is built.
5. AWS authentication is performed.
6. Docker image is pushed to Amazon ECR.
7. ECS deployment is updated, if configured in the workflow.
8. Application runs on ECS/Fargate.

For AWS authentication, GitHub OpenID Connect (OIDC) can be used instead of storing long-lived AWS access keys.

Check the actual workflow file under `.github/workflows/` for the implemented triggers and deployment steps.

## 10. Verification Commands

Check ECS service:

```bash
aws ecs describe-services \
  --cluster <ECS-CLUSTER-NAME> \
  --services <ECS-SERVICE-NAME> \
  --region ap-south-1
```

Check load balancer target health:

```bash
aws elbv2 describe-target-health \
  --target-group-arn <TARGET-GROUP-ARN> \
  --region ap-south-1
```

Check ECR images:

```bash
aws ecr describe-images \
  --repository-name ecommerce-app \
  --region ap-south-1
```

## 11. Security and Cost Management

- Use IAM roles with least-privilege permissions.
- Avoid hardcoding AWS credentials.
- Never commit `.env`, `.pem`, `.key`, or Terraform state files.
- Review Terraform plans before applying.
- Use protected remote Terraform state for team environments.
- Monitor AWS resources and CloudWatch logs.
- Remember that NAT Gateways and Application Load Balancers can generate ongoing charges.

## 12. Infrastructure Cleanup

When the project is no longer required, remove Terraform-managed resources to avoid unnecessary AWS charges.

Review the destroy plan:

```bash
terraform -chdir=terraform/environments plan -destroy
```

Destroy resources only after confirming the impact:

```bash
terraform -chdir=terraform/environments destroy
```

Back up any required data before deleting infrastructure. Also check for resources created outside Terraform.

## 13. Key Learning Outcomes

Through this project, I gained practical experience in:

- AWS cloud infrastructure management.
- Terraform modules and Infrastructure as Code.
- Docker image creation and containerization.
- Amazon ECR image management.
- Amazon ECS and Fargate deployment.
- VPC, subnet, routing, and security group configuration.
- Application Load Balancer configuration.
- GitHub Actions CI/CD automation.
- AWS IAM and deployment permissions.
- Troubleshooting real-world cloud deployment issues.

## 14. Author

**Saurabh Pawar**

B.Sc. Information Technology  
Cloud & DevOps Engineering Learner

**GitHub:**  
https://github.com/saurabh4516

**Project Repository:**  
https://github.com/saurabh4516/infra-as-code-pipeline

---

*This project was developed as a hands-on demonstration of Infrastructure as Code, containerization, AWS deployment, and CI/CD automation.*
