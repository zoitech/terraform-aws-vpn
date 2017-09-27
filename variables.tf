data "aws_caller_identity" "current" { }

provider "aws" {
  region = "${var.aws_region}"
}

variable "aws_region" {
  description = "The AWS Region to run in."
  default     = "eu-central-1"
}

variable "name"{
  description = "The name which is used for the resource names. Other names will be created using this variable."
  default     = "vpn-module"
}
variable "bgp_asn" {
  description = "The ASN for the VPN."
  default     = "65000"
}

variable "type"{
  description = "The VPN Type."
  default     = "ipsec.1"
}

variable "cgw_ip"{
  description = "The Customer gateway IP."
}

variable "static_routes_only"{
  description = "Defines whether only static routes should be created."
  default     = "true"
}

variable "destination_cidr_block"{
  description = "Subnetworks to route."
  type        = "list"
}

variable "vpc_id"{
  description = "The VPC ID used to attach to all resources."
}

variable "routetable_id"{
  description = "The route table to use for routing."
}
