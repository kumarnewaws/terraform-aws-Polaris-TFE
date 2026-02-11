module "instance" {
  source  = "app.terraform.io/CloudGroup/instance/aws"
  version = "1.0.0"
  env     = module.prodnetwork.env
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
  subnet_id         = module.prodnetwork.PublicSubnetId
  private_subnet_id = module.prodnetwork.PrivateSubnetId
  sg_id             = module.prodsecurity.sg_id
  vpc_name          = module.prodnetwork.vpcname
  depends_on        = [module.prodnetwork]
}
