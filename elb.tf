module "elb" {
  source         = "app.terraform.io/CloudGroup/elb/aws"
  version        = "1.0.0"
  nlbname        = "prodnlb"
  Public_subnets = module.network.PublicSubnetId
  sg_id          = module.security.sg_id
  env            = module.network.env
  PrivateServers = module.instance.PrivateServerId
  PublicServers  = null
  vpc_id         = module.network.vpc_id
  tgname         = "ProdTG"
  certarn        = aws_acm_certificate.prodcert.arn
}
