terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
       backend "s3" {
    bucket = "roboshop-state-dev"     
    key    = "infra-user"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking-dev" 
  }
}

provider "aws" {
   region = "us-east-1"

}
