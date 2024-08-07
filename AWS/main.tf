module "vpc" {
  source = "./vpc"

  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  vpc_name          = var.vpc_name
  subnet_name       = var.subnet_name
}

module "ec2_instance" {
  source = "./ec2"

  region          = var.region
  instance_type   = var.instance_type
  key_name        = var.key_name
  instance_name   = var.instance_name
  sg_name         = var.sg_name
  sg_description  = var.sg_description
  sg_ingress_cidr = var.sg_ingress_cidr
  sg_egress_cidr  = var.sg_egress_cidr
  subnet_id       = module.vpc.subnet_id # Ensure the EC2 instance is created in the VPC subnet

}

module "elastic_ip" {
  source      = "./eip"
  instance_id = module.ec2_instance.instance_id
  eip_name    = "terraform-eip"
}

module "eks_cluster" {
  source           = "./eks"
  cluster_name     = var.cluster_name
  cluster_version  = var.cluster_version
  subnet_ids       = [module.vpc.subnet_id]
  vpc_id           = module.vpc.vpc_id
  desired_capacity = var.desired_capacity
  max_capacity     = var.max_capacity
  min_capacity     = var.min_capacity
  key_name         = var.key_name
  cluster_role_arn = var.cluster_role_arn
  node_role_arn    = var.node_role_arn
  disk_size        = var.disk_size
}
