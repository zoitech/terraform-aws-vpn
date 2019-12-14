output "tunnel1_address" {
  value = aws_vpn_connection.main.tunnel1_address
}

output "tunnel2_address" {
  value = aws_vpn_connection.main.tunnel2_address
}

output "tunnel1_bgp_asn" {
  value = aws_vpn_connection.main.tunnel1_bgp_asn
}

output "tunnel2_bgp_asn" {
  value = aws_vpn_connection.main.tunnel2_bgp_asn
}

