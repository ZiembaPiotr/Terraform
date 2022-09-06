resource "null_resource" "test-slaves" {
    provisioner "local-exec"{
        command = "ssh ${var.default_username[openstack_compute_instance_v2.ansible_master.block_device[0].uuid]}@${openstack_compute_floatingip_v2.floatip.address} 'bash /home/centos/run-ansible.sh'"
    
    }


    depends_on = [
        null_resource.copy-remote-inventory
    ]
}