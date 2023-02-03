
variable "prv_subnet_ids" {}
variable "file_handler" {}
variable "function_name" {}
variable "file_name" {}
variable "memory_size" {}
variable "runtime" {}
variable "lambda_bucket" {}
variable "vpc_lambda" {}
variable "pub_subnet_ids" {}
variable "load_balancer_name" {}
variable "target_group_name" {}
variable "timeout" {}



variable "alb_request_methods" {
  description = "The request methods to be created on the ALB."
  type = list(string)
  default = ["OPTIONS", "GET"]
}
variable "envs" {
  
}
