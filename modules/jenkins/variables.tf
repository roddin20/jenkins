variable "app_name" {}

variable "region" {}
variable "availability_zones" {
    type = "list"
}

variable "vpc_cidr" {}
variable "subnets" {
    type = "list"
}

variable "ssh_pub_key" {}

variable "amis" {
    type = "map"
    default {
        "us-east-1" = "ami-6d1c2007"
        "us-west-1" = "ami-af4333cf"
        "us-west-1" = "ami-d2c924b2"
    }
}


