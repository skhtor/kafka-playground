provider "aws" {
  profile = "acloudguru"
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket = "3421-4728-4271-terraform-statestore"
    region = "ap-southeast-2"
    key = "statefile"
  }
}

resource "aws_vpc" "kafka-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Kafka VPC"
  }
}
