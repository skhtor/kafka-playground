//subnets.tf

resource "aws_route_table" "kafka-route-table" {
  vpc_id = "${aws_vpc.kafka-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.kafka-env-gw.id}"
  }
  tags {
    Name = "kafka-env-route-table"
  }
}

resource "aws_route_table_association" "kafka-subnet-association-a" {
  subnet_id      = "${aws_subnet.kafka-subnet-a.id}"
  route_table_id = "${aws_route_table.kafka-route-table.id}"
}

resource "aws_route_table_association" "kafka-subnet-association-b" {
  subnet_id      = "${aws_subnet.kafka-subnet-b.id}"
  route_table_id = "${aws_route_table.kafka-route-table.id}"
}

resource "aws_route_table_association" "kafka-subnet-association-c" {
  subnet_id      = "${aws_subnet.kafka-subnet-c.id}"
  route_table_id = "${aws_route_table.kafka-route-table.id}"
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
