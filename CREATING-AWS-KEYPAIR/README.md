# Terraform AWS Key Pair Creation

This repository contains Terraform configuration files to create an AWS key pair. The key pair is used to securely access EC2 instances.

## Files

- `main.tf`: Configures the Terraform AWS provider and backend for storing state.
- `key-pair.tf`: Defines the AWS key pair resource.
- `output.tf`: Specifies the output value to display the name of the created key pair.

## Usage

1. **Generate SSH Key Pair:**

   You need to manually generate an SSH key pair. Use the following command to generate the key pair:

   ```sh
   ssh-keygen -f "terraform-keypair"

2. **Initialize Terraform:**

terraform init

3. **Apply the Configuration:**

terraform apply


## Outputs
key-pair-name: The name of the created AWS key pair.


## Cleanup
To remove the created key pair, run:
terraform destroy
Confirm the destroy with yes.

## Notes
Ensure the public key file terraform-keypair.pub is in the same directory as your Terraform files.
The private key file terraform-keypair should be securely stored and not shared.