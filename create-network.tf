resource "openstack_networking_network_v2" "network" {
  name           = var.network
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name            = var.subnet.name
  network_id      = openstack_networking_network_v2.network.id
  cidr            = var.subnet.cidr
  dns_nameservers = var.dns
  host_routes {
    destination_cidr = var.subnet.host_routes.destination
    next_hop         = var.subnet.host_routes.nexthop
  }
}
