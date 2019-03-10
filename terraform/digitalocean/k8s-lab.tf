# Lab file
resource "digitalocean_droplet" "k8s-lab-01" {
  image              = "centos-7-x64"
  ipv6               = true
  name               = "k8s-lab-01.srv.dchin.dev"
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

resource "digitalocean_record" "k8s-lab-01" {
  domain = "${digitalocean_domain.srv_dchin_dev.name}"
  type   = "A"
  ttl    = 60
  name   = "${element(split(".", digitalocean_droplet.k8s-lab-01.name),0 )}"
  value  = "${digitalocean_droplet.k8s-lab-01.ipv4_address}"
}

#resource "digitalocean_droplet" "k8s-lab-02" {
#  image              = "centos-7-x64"
#  ipv6               = true
#  name               = "k8s-lab-02.srv.dchin.dev"
#  private_networking = true
#  region             = "nyc1"
#  size               = "s-1vcpu-1gb"
#
#  ssh_keys = [
#    "17697145",
#  ]
#
#  tags = [
#    "${digitalocean_tag.managed_ansible.id}",
#    "${digitalocean_tag.managed_tf.id}",
#    "${digitalocean_tag.k8s_lab.id}",
#  ]
#}
#
#resource "digitalocean_record" "k8s-lab-02" {
#  domain = "${digitalocean_domain.srv_dchin_dev.name}"
#  type   = "A"
#  ttl    = 60
#  name   = "${element(split(".", digitalocean_droplet.k8s-lab-02.name),0 )}"
#  value  = "${digitalocean_droplet.k8s-lab-02.ipv4_address}"
#}

