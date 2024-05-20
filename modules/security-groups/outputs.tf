output "sg-basion" {
  value = aws_security_group.cmc_sg_mgmt_basion.id
}
output "sg-app-prod" {
  value = aws_security_group.cmc_sg_app_prod.id
}
output "sg-db-prod" {
  value = aws_security_group.cmc_sg_db_prod.id
}
output "sg-dev" {
  value = aws_security_group.cmc_sg_dev.id
}
output "sg-uat" {
  value = aws_security_group.cmc_sg_uat.id
}
