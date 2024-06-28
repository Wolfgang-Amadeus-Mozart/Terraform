terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
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