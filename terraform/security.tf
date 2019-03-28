//security.tf
resource "aws_security_group" "ingress-all-kafka" {
  name = "allow-all-sg"
  vpc_id = "${aws_vpc.kafka-vpc.id}"
  ingress {
      cidr_blocks = [
        "0.0.0.0/0"
      ]
      from_port = 22
      to_port = 22
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "0.0.0.0/0"
      ]
      from_port = 80
      to_port = 80
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 2181
      to_port = 2181
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 3888
      to_port = 3888
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 8081
      to_port = 8081
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 8082
      to_port = 8082
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 8083
      to_port = 8083
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 8088
      to_port = 8088
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 9021
      to_port = 9021
      protocol = "tcp"
  }
  ingress {
      cidr_blocks = [
        "10.0.0.0/32"
      ]
      from_port = 9092
      to_port = 9092
      protocol = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
