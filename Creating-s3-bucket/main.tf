terraform {
  required_providers { #here is were we define 
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0" #difining version
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