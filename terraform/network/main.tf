# Network
resource "yandex_vpc_network" "network-01" {
  name = "network-01"
}

# Subnet-a
resource "yandex_vpc_subnet" "network-01-subnet-a" {
  name           = "network-01-subnet-a"
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-01.id
}

# Subnet-b
resource "yandex_vpc_subnet" "network-01-subnet-b" {
  name           = "network-01-subnet-b"
  v4_cidr_blocks = ["10.3.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-01.id
}


