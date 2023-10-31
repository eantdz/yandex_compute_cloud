data "yandex_vpc_subnet" "network-01-subnet-a" {
  name = "network-01-subnet-a"
}

data "yandex_vpc_security_group" "docker-swarm-security" {
  name = "docker-swarm-security"
}

data "yandex_compute_instance" "docker-master-01" {
  name = "docker-master-01"
}

data "yandex_compute_instance" "docker-slave-01" {
  name = "docker-slave-01"
}
