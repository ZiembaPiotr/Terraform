resource "local_file" "remote_inventory" {
  content = templatefile("inventory-remote/remote-inventory.tmpl",
    {
      hosts            = openstack_compute_instance_v2.ansible_slaves
      default_username = var.default_username
      ansible_groups   = var.ansible_groups
      slave_group_map  = var.slave_group_map
    }
  )
  filename = "inventory-remote/remote-inventory"

  depends_on = [
    null_resource.run-local-playbook
  ]
}
