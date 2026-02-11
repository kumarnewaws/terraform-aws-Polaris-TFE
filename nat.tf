module "nat" {
  source          = "app.terraform.io/CloudGroup/nat/aws"
  version         = "1.0.0"
  env             = module.network.env
  Public_Subnet_1 = module.network.PublicSubnetId_1
  vpc_name        = module.network.vpcname
}
