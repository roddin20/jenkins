variable "app_name" {}
variable "profile" {}

variable "region" {}
variable "availability_zones" {
    type = "list"
}

variable "vpc_cidr" {}
variable "subnets" {
    type = "list"
}

variable "ssh_pub_key" {}

provider "aws" {
    region = "${var.region}"
    profile = "${var.profile}"
}

data "terraform_remote_state" "remote-state" {
    backend = "s3"
    config {
        bucket = "rrusso-terraform-remote-state"
        key = "tf/sandbox/us-east-1.tf"
        region = "us-east-1"      
    }
}

module "jenkins" {
    source = "../../../modules/jenkins"
    app_name = "${var.app_name}"

    region = "${var.region}"

    vpc_cidr = "${var.vpc_cidr}"
    availability_zones = "${var.availability_zones}"
    subnets = "${var.subnets}"

    ssh_pub_key = "${var.ssh_pub_key}"
}
