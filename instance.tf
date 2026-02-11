module "instance" {
  source  = "app.terraform.io/CloudGroup/instance/aws"
  version = "1.0.0"
  env     = module.network.env
  ami = {
    us-east-1  = "ami-0b6c6ebed2801a5cb"
    ap-south-1 = "ami-019715e0d74f695be"
  }
  region        = var.region
  instance_type = "t3.micro"
  key_name = {
    us-east-1  = "Desktop_key"
    ap-south-1 = "Desktop_key"
  }
  subnet_id         = module.network.PublicSubnetId
  private_subnet_id = module.network.PrivateSubnetId
  sg_id             = module.security.sg_id
  vpc_name          = module.network.vpcname
  depends_on        = [module.network]
}
