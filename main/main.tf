#create vpc

module "vpc" {
  source = "../modules/vpc"
  regions                   = var.regions
  vpc_ids                   = var.vpc_ids
  project_names             = var.project_names
  cidr_block_snet_appprod   = var.cidr_block_snet_appprod
  cidr_block_snet_dbprod    = var.cidr_block_snet_dbprod
  cidr_block_public_snet_fw = var.cidr_block_public_snet_fw
  cidr_block_snet_mgmt      = var.cidr_block_snet_mgmt
  cidr_block_snet_appdev    = var.cidr_block_snet_appdev
  cidr_block_snet_dbdev     = var.cidr_block_snet_dbdev
  cidr_block_snet_appuat    = var.cidr_block_snet_appuat
  cidr_block_snet_dbuat     = var.cidr_block_snet_dbuat
}

#create nat
module "nat-gw" {
  source = "../modules/nat"
  igw = module.vpc.igw
  vpc_ids = module.vpc.vpc_ids
  cidr_block_snet_mgmt = module.vpc.cidr_block_snet_mgmt
  cidr_block_snet_appdev = module.vpc.cidr_block_snet_appdev
  cidr_block_snet_dbdev = module.vpc.cidr_block_snet_dbdev
  cidr_block_snet_appuat = module.vpc.cidr_block_snet_appuat
  cidr_block_snet_dbuat = module.vpc.cidr_block_snet_dbuat
  cidr_block_snet_appprod = module.vpc.cidr_block_snet_appprod
  cidr_block_snet_dbprod = module.vpc.cidr_block_snet_dbprod
  cidr_block_public_snet_fw = module.vpc.cidr_block_public_snet_fw
}

#create security groups
module "security-groups" {
  source = "../modules/security-groups"
  vpc_ids = module.vpc.vpc_ids
  project_names = module.vpc.project_names
}

#create instance
module "instance" {
  source = "../modules/instance"
  project_names           = module.vpc.project_names
  cidr_block_snet_appprod = module.vpc.cidr_block_snet_appprod
  cidr_block_snet_dbprod  = module.vpc.cidr_block_snet_dbprod
  cidr_block_snet_mgmt    = module.vpc.cidr_block_snet_mgmt
  cidr_block_snet_appdev  = module.vpc.cidr_block_snet_appdev
  cidr_block_snet_appuat  = module.vpc.cidr_block_snet_appuat
  cmc_sg_mgmt_basion      = module.security-groups.sg-basion
  cmc_sg_app_prod         = module.security-groups.sg-app-prod
  cmc_sg_db_prod          = module.security-groups.sg-db-prod
  cmc_sg_dev              = module.security-groups.sg-dev
  cmc_sg_uat              = module.security-groups.sg-uat
  cmc_instance_type       = var.cmc_instance_type
  ami                     = var.ami
}