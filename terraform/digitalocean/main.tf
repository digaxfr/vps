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

resource "digitalocean_droplet" "k8s-lab-01" {
  image              = "centos-7-x64"
  ipv6               = true
  name               = "k8s-lab-01"
  private_networking = true
  region             = "nyc1"
  size               = "s-1vcpu-1gb"

  ssh_keys = [
    "17697145",
  ]

  tags = [
    "${digitalocean_tag.managed_ansible.id}",
    "${digitalocean_tag.managed_tf.id}",
    "${digitalocean_tag.k8s_lab.id}",
  ]
}

resource "digitalocean_tag" "managed_ansible" {
  name = "managed_ansible"
}

resource "digitalocean_tag" "managed_tf" {
  name = "managed_tf"
}

resource "digitalocean_tag" "k8s_etcd" {
  name = "k8s_etcd"
}

resource "digitalocean_tag" "k8s_lab" {
  name = "k8s_lab"
}

resource "digitalocean_tag" "k8s_master" {
  name = "k8s_master"
}

resource "digitalocean_tag" "k8s_node" {
  name = "k8s_node"
}

resource "digitalocean_tag" "bogus1" {
  name = "bogus1"
}

output droplet1_ipv4 {
  value = "${digitalocean_droplet.droplet1.ipv4_address}"
}
