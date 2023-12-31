variable "aws_access_key" {
  type    = string
}

variable "aws_secret_key" {
  type    = string
}

// ==== VPC ====
variable "vpc_id" {
  type    = string
  default = "vpc-013d5fbaee737daad" // ID VPC
}