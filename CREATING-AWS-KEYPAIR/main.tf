terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" { #defining to where the backend file will be created
    bucket = "filipe-remote-state-bucket"
    key    = "Terraform-Keypair/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"


  default_tags {
    tags = {
      owner      = "filipe"
      managed-by = "terraform"
    }
  }
}

