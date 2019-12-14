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

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
