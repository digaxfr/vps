variable do_token {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_droplet" "droplet1" {
  image  = "fedora-28-x64"
  ipv6   = true
  name   = "vps2"
  region = "nyc1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    "17697145",
  ]

  tags = [
    "${digitalocean_tag.managed_ansible.id}",
    "${digitalocean_tag.managed_tf.id}",
    "${digitalocean_tag.k8s_etcd.id}",
    "${digitalocean_tag.k8s_master.id}",
    "${digitalocean_tag.k8s_node.id}",
  ]

  volume_ids = [
    "${digitalocean_volume.droplet1_home.id}",
  ]
}

resource "digitalocean_volume" "droplet1_home" {
  region = "nyc1"
  name   = "vps2-home"
  size   = 25
}

resource "digitalocean_record" "droplet1" {
  domain = "${digitalocean_domain.srv_dchin_dev.name}"
  type   = "A"
  name   = "${digitalocean_droplet.droplet1.name}"
  value  = "${digitalocean_droplet.droplet1.ipv4_address}"
}
