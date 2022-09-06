resource "null_resource" "copy-remote-inventory" {
    provisioner "local-exec"{
        command = "ansible-playbook -i inventory-local/local-inventory playbooks/copy-remote-inventory.yml"
    }

    depends_on = [
        local_file.remote_inventory,
        null_resource.run-local-playbook
    ]
}
