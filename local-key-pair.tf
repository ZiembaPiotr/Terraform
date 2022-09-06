resource "openstack_compute_keypair_v2" "ubuntu_keypair" {
  name       = "ubuntu-keypair"
  public_key = file("~/.ssh/id_rsa.pub")
}