data "yandex_vpc_subnet" "network-01-subnet-a" {
  name = "network-01-subnet-a"
}

data "yandex_vpc_security_group" "docker-swarm-security" {
  name = "docker-swarm-security"
}
