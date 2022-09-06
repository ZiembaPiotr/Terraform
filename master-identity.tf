resource "openstack_compute_keypair_v2" "AM_keypair" {
  name = "AM-SSH-keypair"
}


resource "local_file" "public-identity" {
    content  = openstack_compute_keypair_v2.AM_keypair.public_key
    filename = "master-identity/id_rsa.pub"
}


resource "local_file" "private-identity" {
    content  = openstack_compute_keypair_v2.AM_keypair.private_key
    filename = "master-identity/id_rsa"
}