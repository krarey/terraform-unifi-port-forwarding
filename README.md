# terraform-unifi-port-forwarding
Terraform module for Unifi port forwards via Consul-Terraform Sync

## Usage
This module is intended for use by [Consul-Terraform Sync](https://github.com/hashicorp/consul-terraform-sync). The following CTS task will open port forwarding for all services which define `unifi-proto` and `unifi-port-forward` metadata on at least one service instance.

```
task {
  name        = "unifi-port-forward"
  description = "Pushes port-forwarding rules to Unifi Network"
  enabled     = true
  providers   = ["unifi"]
  module      = "<...>"
  condition "services" {
    regexp = ".*"
    filter = "Service.Meta contains \"unifi-proto\" and Service.Meta contains \"unifi-port-forward\""
  }
}
```
