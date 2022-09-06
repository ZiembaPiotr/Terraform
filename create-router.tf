resource "openstack_networking_port_v2" "int1" {
  network_id     = "47d906c6-3499-4e6c-a068-75ec85d0bbdb"
  admin_state_up = "true"
  fixed_ip {
    subnet_id  = "2f105d6e-0e2d-43f2-af7c-dee606763191"
    ip_address = "192.168.0.3"
  }
}

resource "openstack_networking_port_v2" "int2" {
  network_id     = openstack_networking_network_v2.network.id
  admin_state_up = "true"
  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet.id
    ip_address = "192.168.2.1"
  }
}


resource "openstack_networking_router_interface_v2" "R2_int1" {
  router_id = openstack_networking_router_v2.router.id
  port_id   = openstack_networking_port_v2.int1.id
}

resource "openstack_networking_router_interface_v2" "R2_int2" {
  router_id = openstack_networking_router_v2.router.id
  port_id   = openstack_networking_port_v2.int2.id
}


resource "openstack_networking_router_v2" "router" {
  name           = var.router
  admin_state_up = "true"
}


resource "openstack_networking_router_route_v2" "R2_routes" {
  count            = length(var.static_routes_R2)
  router_id        = openstack_networking_router_v2.router.id
  destination_cidr = var.static_routes_R2[count.index].destination
  next_hop         = var.static_routes_R2[count.index].nexthop
}

