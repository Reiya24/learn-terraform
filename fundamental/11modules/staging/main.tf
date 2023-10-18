module "ec2" {
  source = "../_modules/ec2"
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  list_vm = var.list_vm
}

module "sg" {
  source = "../_modules/sg"
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  vpc_id = var.vpc_id
}