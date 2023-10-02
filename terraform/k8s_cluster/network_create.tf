### Starting manifest
resource "yandex_vpc_network" "k8s-network" {
  name = "k8s-network"
}

resource "yandex_vpc_subnet" "k8s-subnet-a" {
  name           = "k8s-subnet-a"
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.k8s-network.id
}

resource "yandex_vpc_subnet" "k8s-subnet-b" {
  name           = "k8s-subnet-b"
  v4_cidr_blocks = ["10.3.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.k8s-network.id
}

resource "yandex_vpc_subnet" "k8s-subnet-c" {
  name           = "k8s-subnet-c"
  v4_cidr_blocks = ["10.4.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.k8s-network.id
}
