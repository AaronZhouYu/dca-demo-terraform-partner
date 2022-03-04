resource "aws_lb" "chef_automate" {
  load_balancer_type = "application"
  name               = "chef-automate-${random_id.instance_id.hex}"
  internal           = "false"
  security_groups    = ["${aws_security_group.chef_servers.id}"]
  subnets            = ["${aws_subnet.chef-subnet-a.id}","${aws_subnet.chef-subnet-b.id}","${aws_subnet.chef-subnet-c.id}"]
  tags               = {
    Name               = "chef_automate_${random_id.instance_id.hex}_alb"
    X-Dept             = "${var.tag_dept}"
    X-Customer         = "${var.tag_customer}"
    X-Project          = "${var.tag_project}"
    X-Application      = "${var.tag_application}"
    X-Contact          = "${var.tag_contact}"
    X-TTL              = "${var.tag_ttl}"
  }
}

resource "aws_lb_target_group" "chef_automate" {
  name                 = "chef-automate-${random_id.instance_id.hex}"
  vpc_id               = "${aws_vpc.chef-vpc.id}"
  port                 = "443"
  protocol             = "HTTPS"

  depends_on = [aws_lb.chef_automate]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "chef_automate" {
  domain_name       = "${var.alb_acm_domain-name}"
  validation_method = "DNS"
  
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "chef_automate_${random_id.instance_id.hex}_certificate"
  }
}

resource "aws_lb_listener" "chef_automate" {
  load_balancer_arn = "${aws_lb.chef_automate.arn}"
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = "${aws_acm_certificate.chef_automate.arn}"
  default_action {
    target_group_arn = "${aws_lb_target_group.chef_automate.id}"
    type             = "forward"
  }
}

resource "aws_lb_listener_certificate" "chef_automate" {
  listener_arn    = "${aws_lb_listener.chef_automate.arn}"
  certificate_arn = "${aws_acm_certificate.chef_automate.arn}"
}

resource "aws_lb_target_group_attachment" "chef_automate" {
  target_group_arn = "${aws_lb_target_group.chef_automate.arn}"
  target_id        = "${aws_instance.chef_automate.id}"
  port             = 443
}
