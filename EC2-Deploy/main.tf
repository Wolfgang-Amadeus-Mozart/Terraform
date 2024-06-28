terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" {
    bucket = "filipe-remote-state-bucket"
    key    = "Provisioners-lecture/terraform.tfstate"
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



data "terraform_remote_state" "vpc" { #reading a previously created remote state
  backend = "s3"
  config = {
    bucket = "filipe-remote-state-bucket" #mentioned the bucket and the bucket key were the state file was saved previously
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "vpc" { #reading a previously created remote state
  backend = "s3"
  config = {
    bucket = "filipe-remote-state-bucket" #mentioned the bucket and the bucket key were the state file was saved previously
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}