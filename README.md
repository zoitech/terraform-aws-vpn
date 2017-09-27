# AWS VPN aconnection
Terraform module which setup a static routed vpn connection
* Set VGW, CGW and Connection
* Set password policy
* Add a logging bucket
* Enable CloudTail


## Usage
```hcl
module "account" {
  source = "zoitech/vpn/aws"
  name = "CORP_NET"
  cgw_ip = "1.2.3.4"
  vpc_id = "${module.network.vpc_id}"
  route_private = "${module.network.rt_private_id}"
  destination_cidr_block = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}
```

## Authors
Module managed by [Zoi](https://github.com/zoitech).

## License
MIT License. See LICENSE for full details.
