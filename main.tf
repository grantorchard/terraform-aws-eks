locals {
  vpc_id = data.terraform_remote_state.terraform-aws-core.outputs.vpc_id
  subnets = data.terraform_remote_state.terraform-aws-core.outputs.public_subnets
}

resource random_pet "this" {
  length = 2
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "13.0.0"

  vpc_id = local.vpc_id
  subnets = local.subnets
  cluster_name = random_pet.this.id
}
