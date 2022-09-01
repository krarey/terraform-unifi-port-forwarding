resource "unifi_port_forward" "service" {
  for_each               = var.services
  name                   = each.key
  src_ip                 = "any"
  fwd_ip                 = each.value.address
  fwd_port               = each.value.port
  dst_port               = each.value.port
  protocol               = each.value.meta.unifi-proto
  port_forward_interface = "wan"
}
