resource "digitalocean_domain" "srv_dchin_dev" {
  name = "srv.dchin.dev"
}

resource "digitalocean_record" "odroidn2_01" {
  domain = "${digitalocean_domain.srv_dchin_dev.name}"
  type   = "A"
  ttl    = 60
  name   = "odroidn2-01"
  value  = "192.168.1.192"
}

resource "digitalocean_record" "rock64_01" {
  domain = "${digitalocean_domain.srv_dchin_dev.name}"
  type   = "A"
  ttl    = 60
  name   = "rock64-01"
  value  = "192.168.1.191"
}
