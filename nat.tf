module "nat" {
  source          = "app.terraform.io/CloudGroup/nat/aws"
  version         = "1.0.0"
  env             = module.prodnetwork.env
  Public_Subnet_1 = module.prodnetwork.PublicSubnetId_1
  vpc_name        = module.prodnetwork.vpcname
}
