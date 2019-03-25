provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
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

resource "aws_subnet" "kafka-subnet-a" {
  vpc_id = "${aws_vpc.kafka-vpc.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "Kafka Subnet A"
  }
}

resource "aws_subnet" "kafka-subnet-b" {
  vpc_id = "${aws_vpc.kafka-vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "Kafka Subnet B"
  }
}

resource "aws_subnet" "kafka-subnet-c" {
  vpc_id = "${aws_vpc.kafka-vpc.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-southeast-2c"

  tags = {
    Name = "Kafka Subnet C"
  }
}

resource "aws_launch_configuration" "kafka-lc" {
  name_prefix   = "kafka-"
  image_id      = "ami-04481c741a0311bbb"
  instance_type = "t2.micro"
  user_data     = "yum install -y wget"
}

resource "aws_autoscaling_group" "kafka-asg" {
  name                      = "kafka-asg"
  max_size                  = 1
  min_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.kafka-lc.name}"
  vpc_zone_identifier       = ["${aws_subnet.kafka-subnet-a.id}",
                               "${aws_subnet.kafka-subnet-b.id}",
                               "${aws_subnet.kafka-subnet-c.id}"]
}
