terraform {
  required_version = ">= 1.5.4, < 1.5.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }

  }
}


