module "network" {
  source              = "app.terraform.io/CloudGroup/network/aws"
  version             = "1.0.0"
  vpc_name            = "PolarisProd"
  vpc_cidr            = "192.168.0.0/16"
  public_subnet_cidr  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  private_subnet_cidr = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24","192.168.40.0/24"]
  az                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  env                 = "Prod"
  NGW_ID              = module.nat.ngw_id
}
