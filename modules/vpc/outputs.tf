output "vpc_ids" {
    value = aws_vpc.cmc_vpc.id
} 
output "project_names" {
    value = var.project_names
} 
output "cidr_block_public_snet_fw" {
    value = aws_subnet.cmc_pubclic_subnet_fw.id
} 
output "cidr_block_snet_appprod" {
    value = aws_subnet.cmc_subnet_appprod.id
} 
output "cidr_block_snet_dbprod" {
    value = aws_subnet.cmc_subnet_dbprod.id
} 
output "cidr_block_snet_mgmt" {
    value = aws_subnet.cmc_subnet_mgmt.id
} 
output "cidr_block_snet_appdev" {
    value = aws_subnet.cmc_subnet_appdev.id
} 
output "cidr_block_snet_dbdev" {
    value = aws_subnet.cmc_subnet_dbdev.id
} 
output "cidr_block_snet_appuat" {
    value = aws_subnet.cmc_subnet_appuat.id
} 
output "cidr_block_snet_dbuat" {
    value = aws_subnet.cmc_subnet_dbuat.id
} 

output "igw" {
  value = aws_internet_gateway.cmc_igw.id
}