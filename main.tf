resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "${var.name}_VGW"
  }
}

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = "${var.bgp_asn}"
  ip_address = "${var.cgw_ip}"
  type       = "${var.type}"

  tags = {
    Name = "${var.name}_CGW"
  }
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = "${aws_vpn_gateway.vpn_gateway.id}"
  customer_gateway_id = "${aws_customer_gateway.customer_gateway.id}"
  type                = "${var.type}"
  static_routes_only  = "${var.static_routes_only}"

  tags = {
    Name = "${var.name}_Connection"
  }
}

resource "aws_vpn_connection_route" "remote_networks" {
  destination_cidr_block = "${var.destination_cidr_block[count.index]}"
  vpn_connection_id      = "${aws_vpn_connection.main.id}"
  count                  = "${length(var.destination_cidr_block)}"
}

resource "aws_route" "vpn_route" {
    route_table_id         = "${var.routetable_id}"
    destination_cidr_block = "${var.destination_cidr_block[count.index]}"
    gateway_id             = "${aws_vpn_gateway.vpn_gateway.id}"
    count                  = "${length(var.destination_cidr_block)}"
}
