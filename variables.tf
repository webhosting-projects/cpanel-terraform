variable "region" {
  default = "us-east-1"
}

variable "environment" {
  default = "Development"
}

variable "vpc_cidr" {
  description = "VPC cidr block"
}

variable "public_subnet_1_cidr" {
  description = "Public Subnet 1 cidr block"
}

variable "private_subnet_1_cidr" {
  description = "Private Subnet 1 cidr block"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "private_ip" {
  description = "Private IP"
  default     = "10.0.1.12"
}

variable "ami" {
  description = "AMI"
  default     = "ami-0ab4d1e9cf9a1215a"
}

variable "ssh_key" {
  default = "~/.ssh/id_rsa_cpanel.pub"
}

variable "install_cpanel" {
  default = "~/github/cpanel-terraform/scripts/install_cpanel.sh"
}