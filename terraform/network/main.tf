locals {
  name        = "network-01"
  subnet_name = "network-01-subnet"
}

resource "yandex_vpc_network" "network-01" {
  name = local.name
}

resource "yandex_vpc_subnet" "network-01-subnet-a" {
  name           = "${local.subnet_name}-a"
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network-01.id
}

# Subnet-b
resource "yandex_vpc_subnet" "network-01-subnet-b" {
  name           = "${local.subnet_name}-b"
  v4_cidr_blocks = ["10.3.0.0/16"]
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network-01.id
}


