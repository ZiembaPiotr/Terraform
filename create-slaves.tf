resource "openstack_compute_instance_v2" "ansible_slaves" {
  count           = length(var.ansible_slaves)
  
  name            = var.ansible_slaves[count.index].name
  flavor_id       = var.ansible_slaves[count.index].flavor_id
  key_pair        = openstack_compute_keypair_v2.AM_keypair.name
  security_groups = var.ansible_slaves[count.index].security_groups

  block_device {
    uuid                  = var.ansible_slaves[count.index].image_id
    source_type           = "image"
    volume_size           = var.ansible_slaves[count.index].volume_size
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    name = var.ansible_slaves[count.index].net_name
  }
}
