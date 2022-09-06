variable "default_username" {
    type    = map
    default = {
        "centos_image_id" = "centos"   # CentOS-8-Stream
        "ubuntu_image_id" = "ubuntu"   # Ubuntu-22-04
    }
}

variable "ansible_groups" {
    type  = list(string)
    default = [
        "www",
        "app"
    ]
}

variable "slave_group_map" {
    type   = map
    default = {
        "AS1" = "www"
        "AS2" = "app"
        "AS3" = "www",
        "AS4" = "app"
    }
}

variable "dns" {
    type    = list(string)
    default = ["dns_ip"]
}