resource "yandex_vpc_address" "master-vm-external-ipv4-addr" {
  name = "master-vm external IPv4 Address"
  deletion_protection = "true"
  external_ipv4_address {
    zone_id = var.default_zone
  }
}