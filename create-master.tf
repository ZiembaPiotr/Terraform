resource "openstack_compute_instance_v2" "ansible_master" {
  name            = var.ansible_master.name
  flavor_id       = var.ansible_master.flavor_id
  key_pair        = openstack_compute_keypair_v2.ubuntu_keypair.name
  security_groups = var.ansible_master.security_groups

  block_device {
    uuid                  = var.ansible_master.image_id
    source_type           = "image"
    volume_size           = var.ansible_master.volume_size
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name = var.ansible_master.net_name
  }
}

resource "openstack_compute_floatingip_v2" "floatip" {
  pool = "internal_ip_01"
}

resource "openstack_compute_floatingip_associate_v2" "AS_FIP" {
  floating_ip = openstack_compute_floatingip_v2.floatip.address
  instance_id = openstack_compute_instance_v2.ansible_master.id
}

