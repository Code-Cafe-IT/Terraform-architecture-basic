resource "aws_vpc" "cmc_vpc" {
  cidr_block = var.vpc_ids
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_names}-vpc"
  }
}

data "aws_availability_zones" "cmc_availability_zone" {
  state = "available"
}

resource "aws_internet_gateway" "cmc_igw" {
  vpc_id = aws_vpc.cmc_vpc.id
  tags = {
        Name = "${var.project_names} - igw"
    }
}
# Create subnet fw
resource "aws_subnet" "cmc_pubclic_subnet_fw" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = true
  cidr_block = var.cidr_block_public_snet_fw
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[0]
  tags = {
    Name = "${var.project_names}-snet-FW"
  }
}

resource "aws_route_table" "cmc_public_rtb" {
  vpc_id = aws_vpc.cmc_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cmc_igw.id
  }
  tags = {
    Name = "${var.project_names}-public-rtb"
  }
}

resource "aws_route_table_association" "cmc_public_rtb_association" {
  subnet_id = aws_subnet.cmc_pubclic_subnet_fw.id
  route_table_id = aws_route_table.cmc_public_rtb.id
}

# Create subnet mgmt
resource "aws_subnet" "cmc_subnet_mgmt" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = false
  cidr_block = var.cidr_block_snet_mgmt
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[0]
  tags = {
    Name = "${var.project_names}-snet-FW"
  }
}
# Create subnet PROD
resource "aws_subnet" "cmc_subnet_appprod" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = false
  cidr_block = var.cidr_block_snet_appprod
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[1]

  tags = {
    Name = "${var.project_names}-snet-Appprod"
  }
}

resource "aws_subnet" "cmc_subnet_dbprod" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = false
  cidr_block = var.cidr_block_snet_dbprod
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[1]
  tags = {
    Name = "${var.project_names}-snet-DBprod"
  }
}
# Create subnet DEV
resource "aws_subnet" "cmc_subnet_appdev" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = false
  cidr_block = var.cidr_block_snet_appdev
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[2]

  tags = {
    Name = "${var.project_names}-snet-AppDev"
  }
}

resource "aws_subnet" "cmc_subnet_dbdev" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = false
  cidr_block = var.cidr_block_snet_dbdev
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[2]
  tags = {
    Name = "${var.project_names}-snet-DVDev"
  }
}
# Create subnet UAT
resource "aws_subnet" "cmc_subnet_appuat" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = false
  cidr_block = var.cidr_block_snet_appuat
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[3]

  tags = {
    Name = "${var.project_names}-snet-AppUat"
  }
}

resource "aws_subnet" "cmc_subnet_dbuat" {
  vpc_id = aws_vpc.cmc_vpc.id
  map_public_ip_on_launch = false
  cidr_block = var.cidr_block_snet_dbuat
  availability_zone = data.aws_availability_zones.cmc_availability_zone.names[3]
  tags = {
    Name = "${var.project_names}-snet-DBUat"
  }
}







