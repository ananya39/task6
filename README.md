# 🚀 Strapi Deployment on AWS (Docker + Terraform + ECS Fargate)

This project demonstrates how to **Dockerize a Strapi app**, push it to **AWS ECR**, deploy it on **AWS ECS (Fargate)** using **Terraform**, and access it through a **public URL** via **Application Load Balancer (ALB)**.

---

## 📋 Project Workflow

flowchart TD
A[Dockerize Strapi App] --> B[Push to ECR]
B --> C[Terraform Code Deployment]
C --> D[AWS Resources (VPC + ECS + ALB)]
D --> E[Public URL - Access Strapi]

Steps & Commands

1. Dockerize Strapi App

    Build the Docker image for the Strapi application:

       docker build -t strapi-app .
2. Push Docker Image to AWS ECR

a. Create an ECR Repository:

    aws ecr create-repository --repository-name strapi-app --region us-east-1

b. Authenticate Docker to AWS ECR:

    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <aws-account-id>.dkr.ecr.us-east-1.amazonaws.com

c. Tag the Docker Image:

    docker tag strapi-app:latest <aws-account-id>.dkr.ecr.us-east-1.amazonaws.com/strapi-app:latest

d. Push the Image to ECR:

    docker push <aws-account-id>.dkr.ecr.us-east-1.amazonaws.com/strapi-app:latest
 
 Replace <aws-account-id> with your actual AWS Account ID.

3. Deploy Infrastructure using Terraform
   Initialize Terraform:

       terraform init

Apply Terraform configuration:

       terraform apply

🔥 This will provision:

-VPC (Virtual Private Cloud)

-Subnets, Internet Gateway, Route Tables

-ECS Cluster (Fargate)

-Application Load Balancer (ALB)

-ECR Repository


4. Access the Strapi App
   After Terraform apply, find the Load Balancer DNS URL.

Open it in your browser.

Set up Strapi via the Admin Panel.

🧹 Cleanup Resources
To destroy all created AWS resources and avoid charges:

    terraform destroy
