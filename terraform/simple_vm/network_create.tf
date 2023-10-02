### Starting manifest
resource "yandex_vpc_network" "vm-network" {
  name = "vm-network"
}

resource "yandex_vpc_subnet" "vm-subnet-a" {
  name           = "vm-subnet-a"
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.vm-network.id
}

