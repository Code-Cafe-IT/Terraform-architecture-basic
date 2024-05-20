resource "aws_instance" "cmc_instance_mgmt" {
    ami = var.ami
    subnet_id = var.cidr_block_snet_mgmt
    key_name = "Nat"
    vpc_security_group_ids = [var.cmc_sg_mgmt_basion]
    instance_type = var.cmc_instance_type
    root_block_device {
    volume_size = 30  # Kích thước EBS Volume
    volume_type           = "gp3"
    encrypted             = true  # Mã hóa EBS Volume
    delete_on_termination = true
  }
    tags = {
        Name = "${var.project_names}-instance-mgmt"
    }
}

resource "aws_instance" "cmc_instance_appprod" {
    count = 2
    ami = var.ami
    subnet_id = var.cidr_block_snet_appprod
    key_name = "Nat"
    vpc_security_group_ids = [var.cmc_sg_app_prod]
    instance_type = var.cmc_instance_type
    root_block_device {
    volume_size = 30  # Kích thước EBS Volume
    volume_type           = "gp3"
    encrypted             = true  # Mã hóa EBS Volume
    delete_on_termination = true
  }
    tags = {
        Name = "${var.project_names}-instance-appprod"
    }
}

resource "aws_instance" "cmc_instance_dbprod" {
    ami = var.ami
    subnet_id = var.cidr_block_snet_dbprod
    key_name = "Nat"
    vpc_security_group_ids = [ var.cmc_sg_mgmt_basion ]
    instance_type = var.cmc_instance_type
    root_block_device {
    volume_size = 30  # Kích thước EBS Volume
    volume_type           = "gp3"
    encrypted             = true  # Mã hóa EBS Volume
    delete_on_termination = true
  }
    tags = {
        Name = "${var.project_names}-instance-dbprod"
    }
}

resource "aws_instance" "cmc_instance_uat" {
    count = 2
    ami = var.ami
    subnet_id = var.cidr_block_snet_appuat
    key_name = "Nat"
    vpc_security_group_ids = [var.cmc_sg_uat]
    instance_type = var.cmc_instance_type
    root_block_device {
    volume_size = 30  # Kích thước EBS Volume
    volume_type           = "gp3"
    encrypted             = true  # Mã hóa EBS Volume
    delete_on_termination = true
  }
    tags = {
        Name = "${var.project_names}-instance-uat"
    }
}

resource "aws_instance" "cmc_instance_dev" {
    count = 2
    ami = var.ami
    subnet_id = var.cidr_block_snet_appdev
    key_name = "Nat"
    vpc_security_group_ids = [var.cmc_sg_dev]
    instance_type = var.cmc_instance_type
    root_block_device {
    volume_size = 30  # Kích thước EBS Volume
    volume_type           = "gp3"
    encrypted             = true  # Mã hóa EBS Volume
    delete_on_termination = true
  }
    tags = {
        Name = "${var.project_names}-instance-dev"
    }
}