resource "aws_security_group" "cmc_sg_mgmt_basion" {
  vpc_id = var.vpc_ids
  description = "Allow RDP - 80 - 443"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = -1
  }
  
  tags = {
    Name = "${var.project_names}-sg-mgmt"
  }
}

resource "aws_security_group" "cmc_sg_app_prod" {
  vpc_id = var.vpc_ids
  description = "Allow RDP - 80 - 443"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    security_groups = [ aws_security_group.cmc_sg_mgmt_basion.id ]
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = -1
  }
  
  tags = {
    Name = "${var.project_names}-sg-app-prod"
  }
}

resource "aws_security_group" "cmc_sg_db_prod" {
  vpc_id = var.vpc_ids
  description = "Allow RDP - 80 - 443"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    security_groups = [ aws_security_group.cmc_sg_mgmt_basion.id ]
  }
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = -1
  }
  
  tags = {
    Name = "${var.project_names}-sg-db-prod"
  }
}

resource "aws_security_group" "cmc_sg_dev" {
  vpc_id = var.vpc_ids
  description = "Allow RDP - 80 - 443"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    security_groups = [ aws_security_group.cmc_sg_mgmt_basion.id ]
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = -1
  }
  
  tags = {
    Name = "${var.project_names}-sg-dev"
  }
  
}

resource "aws_security_group" "cmc_sg_uat" {
  vpc_id = var.vpc_ids
  description = "Allow RDP - 80 - 443"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    security_groups = [ aws_security_group.cmc_sg_mgmt_basion.id ]
  }
  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = -1
  }
  
  tags = {
    Name = "${var.project_names}-sg-uat"
  }
}