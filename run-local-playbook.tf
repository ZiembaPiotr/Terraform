resource "null_resource" "run-local-playbook" {
    provisioner "local-exec"{
        command = "ansible-playbook -i inventory-local/local-inventory playbooks/prepare-master.yml"
    }

    depends_on = [
        local_file.local_inventory
    ]
}
