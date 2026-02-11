module "security" {
  source   = "app.terraform.io/CloudGroup/security/aws"
  version  = "1.0.0"
  vpc_id   = module.prodnetwork.vpc_id
  vpc_name = module.prodnetwork.vpcname
}
