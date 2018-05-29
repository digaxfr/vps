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
    "20963421",
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

output droplet1_ipv4 {
  value = "${digitalocean_droplet.droplet1.ipv4_address}"
}
