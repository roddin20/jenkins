module "global_vars" {
    source = "github.com/roddin20/terraform_modules//global_vars"
}

module "vpc" {
    source = "github.com/roddin20/terraform_modules//modules/vpc"
    app_name = "${var.app_name}"

    region = "${var.region}"
    vpc_cidr = "${var.vpc_cidr}"
}

module "subnets" {
    source = "github.com/roddin20/terraform_modules//modules/subnet"
    app_name = "${var.app_name}"

    availability_zones = "${var.availability_zones}"
    vpc_id = "${module.vpc.vpc_id}"
    subnets = "${var.subnets}"
    route_table_id = "${module.vpc.default-route-table_id}"
    map_public_ip = true
}

module "inbound_security_group" {
    source = "github.com/roddin20/terraform_modules//modules/security_group"
    app_name = "${var.app_name}"

    name = "hbo_inbound"
    description = "Allow HBO common inbound"

    vpc_id = "${module.vpc.vpc_id}"
    sg_rule_types = {
        "0" = "ingress"
        "1" = "ingress"
        "2" = "ingress"
    }
    sg_rule_from_ports = {
        "0" = "22"
        "1" = "8080"
        "2" = "0"
    }
    sg_rule_to_ports = {
        "0" = "22"
        "1" = "8080"
        "2" = "0"
    }
    sg_rule_protocols = {
        "0" = "tcp"
        "1" = "tcp"
        "2" = "icmp"
    }
    sg_rule_cidr_blocks = {
        "0" = "${module.global_vars.hbo_common_ips}"
        "1" = "${module.global_vars.hbo_common_ips}"
        "2" = "${module.global_vars.hbo_common_ips}"
    }
}

module "outbound_security_group" {
    source = "github.com/roddin20/terraform_modules//modules/security_group"
    app_name = "${var.app_name}"

    name = "all_outbound"
    description = "Allow all to internet"

    vpc_id = "${module.vpc.vpc_id}"
    sg_rule_types = {
        "0" = "egress"
    }
    sg_rule_from_ports = {
        "0" = "0"
    }
    sg_rule_to_ports = {
        "0" = "0"
    }
    sg_rule_protocols = {
        "0" = "-1"
    }
    sg_rule_cidr_blocks = {
        "0" = "0.0.0.0/0"
    }
}

module "jenkins_master" {
    source = "github.com/roddin20/terraform_modules//modules/compute"
    app_name = "${var.app_name}"
    instance_name = "jenkins_master"
    role = "jenkins_master"

    instance_count = "1"

    ami = "${lookup(var.amis, var.region)}"
    instance_type = "t2.micro"

    subnet_id = "${element(module.subnets.subnet_ids, 0)}"
    vpc_security_group_ids = [
        "${module.inbound_security_group.security_group_id}",
        "${module.outbound_security_group.security_group_id}"
    ]

    ssh_pub_key = "${var.ssh_pub_key}"
}
