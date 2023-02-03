module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "stage_vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = true
}

 module "lambda_with_vpc" {
  source = "./module"
  for_each = var.lambdas
  lambda_bucket = each.value.lambda_bucket
  function_name = each.value.function_name
  file_name = "${path.module}/module/python/hello-python.py.zip"
  file_handler = each.value.file_handler
  runtime = each.value.runtime
  timeout = each.value.timeout
  memory_size = each.value.memory_size
  prv_subnet_ids = module.vpc.private_subnets
  vpc_lambda = module.vpc.vpc_id
  pub_subnet_ids = module.vpc.public_subnets
  load_balancer_name = each.value.load_balancer_name
  target_group_name = each.value.target_group_name
  envs = each.value.envs
} 

