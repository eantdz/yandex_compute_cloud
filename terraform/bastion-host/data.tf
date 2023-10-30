data "yandex_vpc_subnet" "network-01-subnet-b" {
  name = "network-01-subnet-b"
}

data "yandex_vpc_security_group" "external-bastion-security" {
  name = "external-bastion-security"
}


