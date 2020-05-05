# variables.tf

variable "prefix" {
  description = "Prefix for all envirnoments"
  default = "dev-data-stream"
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default = "ap-southeast-1"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default = "3"
}





