variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.3.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.2.0/24"
}

variable "availability_zone_1" {
  default = "us-east-1a"
}

variable "availability_zone_2" {
  default = "us-east-1b"
}
variable "image_uri" {
  description = "Docker image URI for the ECS task definition"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}
