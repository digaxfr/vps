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
