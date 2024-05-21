variable "cluster-name" {
    default = "dev-cluster"
    type    = string
}

variable "vpc_id" {
    default = "terraform-vpc"
    type    = string
}

variable "node-name" {
    default = "nodegroup1"
    type    = string
}