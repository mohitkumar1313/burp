variable "vpc_name" {
  description = "The name of the VPC"
  default = "my-vpc"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
}

variable "private_subnet_name" {
  description = "The name of the private subnet"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
}

variable "region" {
  description = "The GCP region"
}
variable "project_id" {
  description = "The ID of the GCP project"
}
