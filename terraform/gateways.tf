//gateways.tf
resource "aws_internet_gateway" "kafka-env-gw" {
  vpc_id = "${aws_vpc.kafka-vpc.id}"
tags {
    Name = "kafka-env-gw"
  }
}
