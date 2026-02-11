module "elb" {
  source         = "app.terraform.io/CloudGroup/elb/aws"
  version        = "1.0.0"
  nlbname        = "prodnlb"
  Public_subnets = module.prodnetwork.PublicSubnetId
  sg_id          = module.prodsecurity.sg_id
  env            = module.prodnetwork.env
  PrivateServers = module.prodInstance.PrivateServerId
  PublicServers  = null
  vpc_id         = module.prodnetwork.vpc_id
  tgname         = "ProdTG"
  certarn        = aws_acm_certificate.prodcert.arn
}
