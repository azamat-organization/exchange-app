#   Automate deployment of Exchange app to EC2 hosts (Packer)

![Cloud Image](https://www.middlewareinventory.com/wp-content/uploads/2019/03/cloud.jpeg)



## Overview


The primary goal of this project is to automate the deployment process of the Exchange application onto Amazon EC2 instances using both Packer and Terraform. This ensures consistent, reliable, and repeatable deployments, minimizing manual intervention and reducing the risk of deployment errors.

## Key Requirements:

1. **Integrated Tooling**:

- Utilize Packer to automate the creation of Amazon Machine Images (AMIs) that include the Exchange application and its necessary dependencies.
- Leverage Terraform to automate the infrastructure setup on AWS, ensuring the EC2 instances, networking, security, and other necessary components are correctly provisioned.

2. **Infrastructure Setup**:

- Provision Autoscaling Groups to ensure application availability and scalability.
- Define Security Groups with appropriate inbound and outbound rules to secure the application and its environment.
- Set up an Elastic Load Balancer (ELB) to distribute incoming application traffic across multiple EC2 instances, ensuring higher availability and fault tolerance.
- Create necessary IAM roles to grant required permissions for the app and its associated resources.


3. **Service Management**:

- Implement a systemctl daemon for the Exchange application management on the EC2 instances. This will ensure the application starts automatically upon instance boot, providing continuous service availability.


## Deliverables:
1. **A fully functional Exchange application, accessible via the internet, demonstrating correct responses to user interactions.**
2. **A comprehensive README file detailing**:
- The deployment architecture, illustrating the relationship between different AWS resources and the Exchange application.
- Step-by-step configuration and installation instructions to guide users or engineers through the deployment process.

## Important Note:
Processes started during the AMI creation phase (e.g., using npm start) won't persist when the EC2 instance is initiated from the AMI. To address this, the use of a systemctl daemon (like exchange-frontend) is mandatory. This daemon ensures that the application begins running whenever a new EC2 instance is booted up from the AMI, providing constant service availability.

## Reference Links

**I used official documentation to do this project**:
- [Packer documentation]
- [Terraform documentation AWS]




[Packer documentation]: https://www.packer.io/
[Terraform documentation AWS]: https://registry.terraform.io/providers/hashicorp/aws/latest

## Instructions:
1. **Building AMI Images Using Packer**:
- For the backend AMI, execute the following command:
```bash
   packer build api-exchangeapp.pkr.hcl
```

- For the frontend AMI, execute the following command:
```bash
   packer build web-exchangeapp.pkr.hcl
```

2. **Find your ami id (frontend and backend) and paste it in terraform.tfvars**

3. **Build infrastrcture using Terraform**:
- Once you have built the AMI images using Packer, navigate to the Terraform directory
```bash
cd Exchange-application-terraform/
```
- Initialize the Terraform directory:
```bash
terraform init
```
- Plan your Terraform changes:
```bash
terraform plan
```
- Apply the Terraform configuration:
```bash
terraform apply
```

4. **Manually create Postres Database in VPC, what was created with Terraform**

5. **In Postgres Database Security group open port 5432 and connect to backend instance**


## Challenges:

1. **Packer Variable Issues**: There were problems with the Packer file where it wasn't recognizing variables. As a workaround, I had to hardcode certain resources.

2. **Database Connection**: There were issues connecting the database to the backend, primarily because of password mismatches.

3. **Rushed Database Creation**: I created a database hastily. It's essential to proceed with confidence, read tickets carefully, and follow instructions attentively.

4. **Unhealthy Target Group Instances**: I found that instances in my target group were marked as unhealthy. Modifying the app.js file slightly resolved this.

5. **Database Creation in Terraform**: Initially, I tried setting up the database in Terraform, but later realized it was another student's project. Ensure you're working on the correct project components.

6. **Manual Database Creation**: When creating the database manually, I missed a step to specify the database name. This omission led to issues when trying to connect the backend to the database.

7. **Connecting Launch Configuration with Secrets Manager**: There were challenges in linking the launch configuration with AWS Secrets Manager. Ensure all permissions and configurations are set correctly.

## link in github to project: Automate deployment of Exchange app to EC2 hosts (Packer)
[Exchange 23a Redhat - Terraform](https://github.com/312-bc/exchange-23a-redhat/tree/feauture/exchange-app-packer/terraform/MRP23AREDH-3)