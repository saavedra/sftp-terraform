# AWS SFTP Server with Terraform

This Terraform project provisions an SFTP server on AWS using EC2 with Amazon Linux 2, and EBS for storage. The configuration includes security groups, IAM roles, and user setup.

### Prerequisites

* __Terraform Installed__: Download and install Terraform from the official website.  
* __AWS CLI Configured__: Set up AWS credentials using aws configure.  
* __SSH Key Pair__: Generate an SSH key pair for EC2 access (see steps below).  
* __IAM Permissions__: Ensure your AWS account has permissions to create EC2 instances, EBS volumes, security groups, and IAM roles.  

### Steps to Run the Project

Clone the Repository
```
git clone https://github.com/saavedra/sftp-terraform.git
cd sftp-terraform
```

Generate an SSH Key Pair Generate an SSH key pair if you don't already have one:

```
ssh-keygen -t rsa -b 2048 -f ~/.ssh/sftp-key -C "your-email@example.com"
```

This creates:

```
Private key: ~/.ssh/sftp-key
Public key: ~/.ssh/sftp-key.pub
```

Save the path to your public key for later use.

Initialize Terraform Run the following command to initialize Terraform and download the required providers:

```
terraform init
terraform plan
terraform apply
```

Fill out variables as prompted. Terraform will output the public IP address of the EC2 instance.

