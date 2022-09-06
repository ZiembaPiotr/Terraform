resource "local_file" "local_inventory" {
  content = templatefile("inventory-local/local-inventory.tmpl",
    {
     image_id   = openstack_compute_instance_v2.ansible_master.block_device[0].uuid
     master_fip = openstack_compute_floatingip_v2.floatip.address
     default_username = var.default_username
    }
  )
  filename = "inventory-local/local-inventory"
}
