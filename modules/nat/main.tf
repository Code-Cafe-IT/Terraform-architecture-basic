resource "aws_eip" "cmc_eip_nat" {
  domain = "vpc"
 
}

resource "aws_nat_gateway" "cmc_nat_gw" {
  allocation_id = aws_eip.cmc_eip_nat.id
  subnet_id = var.cidr_block_public_snet_fw
  depends_on = [ var.igw ]
}

resource "aws_route_table" "cmc_private_rtb" {
  vpc_id = var.vpc_ids
  route {
    nat_gateway_id = aws_nat_gateway.cmc_nat_gw.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "CoreLeasing-Nat"
  }
}

resource "aws_route_table_association" "cmc_rtb_association_mgmt" {
  subnet_id = var.cidr_block_snet_mgmt
  route_table_id = aws_route_table.cmc_private_rtb.id
}
resource "aws_route_table_association" "cmc_rtb_association_appdev" {
  subnet_id = var.cidr_block_snet_appdev
  route_table_id = aws_route_table.cmc_private_rtb.id
}
resource "aws_route_table_association" "cmc_rtb_association_dbdev" {
  subnet_id = var.cidr_block_snet_dbdev
  route_table_id = aws_route_table.cmc_private_rtb.id
}
resource "aws_route_table_association" "cmc_rtb_association_appuat" {
  subnet_id = var.cidr_block_snet_appuat
  route_table_id = aws_route_table.cmc_private_rtb.id
}
resource "aws_route_table_association" "cmc_rtb_association_dbuat" {
  subnet_id = var.cidr_block_snet_dbuat
  route_table_id = aws_route_table.cmc_private_rtb.id
}
resource "aws_route_table_association" "cmc_rtb_association_appprod" {
  subnet_id = var.cidr_block_snet_appprod
  route_table_id = aws_route_table.cmc_private_rtb.id
}
resource "aws_route_table_association" "cmc_rtb_association_dbprod" {
  subnet_id = var.cidr_block_snet_dbprod
  route_table_id = aws_route_table.cmc_private_rtb.id
}