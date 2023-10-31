locals {
  name                = "ipv4-external"
  deletion_protection = "true"
}

resource "yandex_vpc_address" "bastion-host-ipv4-external" {
  name                = "bastion-host-${local.name}"
  deletion_protection = local.deletion_protection
  external_ipv4_address {
    zone_id = var.default_zone
  }
}

resource "yandex_vpc_address" "nlb-ipv4-external" {
  name                = "nlb-${local.name}"
  deletion_protection = local.deletion_protection
  external_ipv4_address {
    zone_id = var.default_zone
  }
}
