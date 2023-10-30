# Static external ipv4 Address to bastion-host 
resource "yandex_vpc_address" "bastion-host-ipv4-external" {
  name                = "bastion-host ipv4-external"
  deletion_protection = "true" # Need change to true in stage/production
  external_ipv4_address {
    zone_id = var.default_zone
  }
}