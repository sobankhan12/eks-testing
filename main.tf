#------------------------------------------------#-----------------------------------------------------------------


########################    Terraform configuration       ###############################

#--------------------------------------------------#----------------------------------------------------------------



terraform {
  required_version = ">= 1.1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2"
    }
  }
#   backend "remote" {
#     organization = "soban252"

#     workspaces {
#       name = "eks-testing"
#     }

#  }
 }
provider "aws" {
  alias = "us-east-1"
  region = var.region1


}
provider "aws" {
  alias = "eu-west-1"
  region = var.region2


}


#------------------------------------------------#-----------------------------------------------------------------


########################    Terraform modules      ###############################

#--------------------------------------------------#----------------------------------------------------------------



module "vpc1" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  project = "we-travel"
  region = var.region1
  providers = {
    aws="us-east-1"
   }
}
module "vpc2" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  project = "we-travel"
  region = var.region2
  providers = {
    aws=aws.eu-west-1
   }
}



# module "rds" {
#   source     = "./modules/rds"
#   vpc_id     = module.vpc.vpc_id
#   cidr_block = module.vpc.cidr_block
#   subnet_ids = [module.vpc.public-us-east-1a, module.vpc.public-us-east-1b]
#   depends_on = [
#     module.vpc
#   ]



# }

# module "eks" {
#   source         = "./modules/eks"
#   vpc_id         = module.vpc.vpc_id
#   eks_subnet_ids = [module.vpc.public-us-east-1a, module.vpc.public-us-east-1b, module.vpc.private-us-east-1a, module.vpc.private-us-east-1b]

#   eks_node_subnets_ids = [module.vpc.private-us-east-1a, module.vpc.private-us-east-1b]

# } 
# module "ecr" {
#   source = "./modules/ecr"
#   name   = "wetravel"
# }


