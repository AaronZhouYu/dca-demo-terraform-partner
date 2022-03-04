resource "aws_vpc" "chef-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name          = "chef_clients_${random_id.instance_id.hex}_vpc"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Contact     = "${var.tag_contact}"
    X-Application = "${var.tag_application}"
    X-TTL         = "${var.tag_ttl}"
  }
}

resource "aws_internet_gateway" "chef-gateway" {
  vpc_id = aws_vpc.chef-vpc.id

  tags = {
    Name          = "chef_clients_${random_id.instance_id.hex}_gateway"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Contact     = "${var.tag_contact}"
    X-Application = "${var.tag_application}"
    X-TTL         = "${var.tag_ttl}"
  }
}

resource "aws_subnet" "chef-subnet-a" {
  vpc_id                  = aws_vpc.chef-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "chef-clients-subnet-a"
  }
}

resource "aws_subnet" "chef-subnet-b" {
  vpc_id                  = aws_vpc.chef-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "chef-clients-subnet-b"
  }
}

resource "aws_subnet" "chef-subnet-c" {
  vpc_id                  = aws_vpc.chef-vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = true
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "chef-clients-subnet-c"
  }
}

resource "aws_route_table" "chef-route-table" {
  vpc_id = aws_vpc.chef-vpc.id
  
  tags = {
    Name = "chef_clients_${random_id.instance_id.hex}_route_table"
  }
}

resource "aws_route_table_association" "chef-route-table-assoc" {
  count          = 3
  route_table_id = aws_route_table.chef-route-table.id
  subnet_id      = element([aws_subnet.chef-subnet-a.id, aws_subnet.chef-subnet-b.id, aws_subnet.chef-subnet-c.id], count.index)
}

resource "aws_route" "chef-route" {
  route_table_id         = aws_route_table.chef-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.chef-gateway.id
  depends_on             = [aws_route_table.chef-route-table]
}

resource "aws_security_group" "chef_clients" {
  name        = "chef_clients_${random_id.instance_id.hex}"
  description = "Chef Clients"
  vpc_id      = aws_vpc.chef-vpc.id

  tags = {
    Name          = "chef_clients_${random_id.instance_id.hex}_security_group"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }
  
  # Allow inbound SSH connection from all
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound WINRM connection from all
  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound WINRM connection from all
  ingress {
    from_port   = 5986
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound RDP connection from all
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Habitat Supervisor HTTP communication from all
  ingress {
    from_port   = 9631
    to_port     = 9631
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Habitat Supervisor HTTP communication from all
  ingress {
    from_port   = 9631
    to_port     = 9631
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Habitat Supervisor ZeroMQ communication from all
  ingress {
    from_port   = 9638
    to_port     = 9638
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Habitat Supervisor ZeroMQ communication from all
  ingress {
    from_port   = 9638
    to_port     = 9638
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Habitat Supervisor CTL communication from all
  ingress {
    from_port   = 9632
    to_port     = 9632
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow Habitat Supervisor CTL communication from all
  ingress {
    from_port   = 9632
    to_port     = 9632
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound NGINX HTTP from all
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound NGINX HTTPS from all
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound event stream communication from all
  ingress {
    from_port   = 4222
    to_port     = 4222
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound etcd communication from all
  ingress {
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound elasticsearch communication from all
  ingress {
    from_port   = 9200
    to_port     = 9400
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound PostgresSQL communication from all
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound leaderel communication from all
  ingress {
    from_port   = 7331
    to_port     = 7331
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound VNC communication from all
  ingress {
    from_port   = 5901
    to_port     = 5901
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
