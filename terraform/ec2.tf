resource "aws_launch_configuration" "kafka-lc" {
  name_prefix   = "kafka-"
  image_id      = "ami-04481c741a0311bbb"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  user_data     = <<USER_DATA
#!/bin/bash
sudo amazon-linux-extras install nginx1.12 -y
sudo service nginx start
  USER_DATA

  key_name      = "${var.ami_key_pair_name}"
  security_groups = ["${aws_security_group.ingress-all-kafka.id}"]
  lifecycle{
    create_before_destroy     = true
  }
}

resource "aws_autoscaling_group" "kafka-asg" {
  name                      = "kafka-asg"
  max_size                  = 1
  min_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  load_balancers            = ["${aws_elb.kafka-elb.name}"]
  launch_configuration      = "${aws_launch_configuration.kafka-lc.name}"
  vpc_zone_identifier       = ["${aws_subnet.kafka-subnet-a.id}",
                               "${aws_subnet.kafka-subnet-b.id}",
                               "${aws_subnet.kafka-subnet-c.id}"]
  lifecycle {
    create_before_destroy     = true
  }
}

resource "aws_elb" "kafka-elb" {
  name               = "kafka-eload-balancer"
  internal           = false
  subnets            = ["${aws_subnet.kafka-subnet-a.id}",
                        "${aws_subnet.kafka-subnet-b.id}",
                        "${aws_subnet.kafka-subnet-c.id}"]
  cross_zone_load_balancing   = true
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }
}