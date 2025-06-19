# Migration_GoDaddy_to_AWS

This repository contains Terraform configurations designed to facilitate the migration of infrastructure from GoDaddy to Amazon Web Services (AWS).  
It automates the provisioning of essential AWS resources, including Virtual Private Cloud (VPC), Relational Database Service (RDS), and other networking components, to replicate and enhance your existing GoDaddy-hosted environment.

---

## 🚀 Project Overview

The primary goal of this project is to streamline the transition from GoDaddy to AWS by:

- Automating the creation of AWS infrastructure components.
- Ensuring a secure and scalable environment tailored to your application's needs.
- Providing modular and reusable Terraform code for easy customization and maintenance.

---

## 📁 Repository Structure

The repository is organized into the following Terraform configuration files:

- `main.tf`: Entry point that orchestrates the provisioning process by including all necessary modules and resources.
- `providers.tf`: Specifies the AWS provider and required versions.
- `variables.tf`: Declares input variables for dynamic configuration.
- `terraform.tfvars`: Assigns values to the declared variables.
- `vpc.tf`: Configures the Virtual Private Cloud, including subnets, route tables, and gateways.
- `rds.tf`: Sets up the AWS RDS instance with specified parameters.
- `output.tf`: Defines the output values to display after resource creation.
- `main - Copy.tf.backub`: Appears to be a backup of the main configuration file.

---

## ✅ Prerequisites

Before deploying the infrastructure, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- An active [AWS account](https://aws.amazon.com/) with appropriate permissions.
- Configured AWS credentials, typically via the AWS CLI or environment variables.

---

## 🔧 Deployment Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/deepaksharma2007/Migration_GoDaddy_to_AWS.git
   cd Migration_GoDaddy_to_AWS

2. **Initialize Terraform**
   ```bash
   terraform init

3. **Review and Modify Variables**

Edit the ***terraform.tfvars*** file to customize variables such as region, VPC CIDR blocks, RDS instance types, and other parameters to match your requirements.

4. **Plan the Deployment**
   ```bash
   terraform plan```
Review the execution plan to understand the resources that will be created or modified.**

5. **Apply the Configuration**
   ```bash
   terraform apply
Confirm the action when prompted. Terraform will provision the specified AWS resources.

6. **Verify the Deployment**
  After successful execution, Terraform will output relevant information such as VPC IDs, RDS endpoints, and other resource identifiers.
