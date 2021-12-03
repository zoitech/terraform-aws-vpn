# terraform-aws-vpn

The following resources are created:

* VPN gateway
* Customer gateway
* VPN connection
* VPN connection route(s)
* Routes

## Usage
```hcl
module "vpn" {
  source = "git::https://github.com/zoitech/terraform-aws-vpn.git"
  name = "CORP_NET"
  cgw_ip = "1.2.3.4"
  vpc_id = module.network.vpc_id
  route_private = module.network.rt_private_id
  destination_cidr_block = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}
```

## Referencing a tagged version
```hcl
module "vpn" {
  source = "git::https://github.com/zoitech/terraform-aws-vpn.git?ref=2.0.0"
  name = "CORP_NET"
  cgw_ip = "1.2.3.4"
  vpc_id = module.network.vpc_id
  route_private = module.network.rt_private_id
  destination_cidr_block = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_customer_gateway.customer_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |
| [aws_route.vpn_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpn_connection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection) | resource |
| [aws_vpn_connection_route.remote_networks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection_route) | resource |
| [aws_vpn_gateway.vpn_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_gateway) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS Region to run in. | `string` | `"eu-central-1"` | no |
| <a name="input_bgp_asn"></a> [bgp\_asn](#input\_bgp\_asn) | The ASN for the VPN. | `string` | `"65000"` | no |
| <a name="input_cgw_ip"></a> [cgw\_ip](#input\_cgw\_ip) | The Customer gateway IP. | `any` | n/a | yes |
| <a name="input_destination_cidr_block"></a> [destination\_cidr\_block](#input\_destination\_cidr\_block) | Subnetworks to route. | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name which is used for the resource names. Other names will be created using this variable. | `string` | `"vpn-module"` | no |
| <a name="input_routetable_id"></a> [routetable\_id](#input\_routetable\_id) | The route table to use for routing. | `any` | n/a | yes |
| <a name="input_static_routes_only"></a> [static\_routes\_only](#input\_static\_routes\_only) | Defines whether only static routes should be created. | `string` | `"true"` | no |
| <a name="input_type"></a> [type](#input\_type) | The VPN Type. | `string` | `"ipsec.1"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID used to attach to all resources. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tunnel1_address"></a> [tunnel1\_address](#output\_tunnel1\_address) | n/a |
| <a name="output_tunnel1_bgp_asn"></a> [tunnel1\_bgp\_asn](#output\_tunnel1\_bgp\_asn) | n/a |
| <a name="output_tunnel2_address"></a> [tunnel2\_address](#output\_tunnel2\_address) | n/a |
| <a name="output_tunnel2_bgp_asn"></a> [tunnel2\_bgp\_asn](#output\_tunnel2\_bgp\_asn) | n/a |
