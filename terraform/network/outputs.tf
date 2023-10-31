output "bastion-host-ipv4-external" {
  value = yandex_vpc_address.bastion-host-ipv4-external.external_ipv4_address
}

output "nlb-ipv4-external" {
  value = yandex_vpc_address.nlb-ipv4-external.external_ipv4_address
}

output "network_id" {
  value = yandex_vpc_network.network-01.id
}

output "network-subnet-a_id" {
  value = yandex_vpc_subnet.network-01-subnet-a.id
}

output "network_subnet-b_id" {
  value = yandex_vpc_subnet.network-01-subnet-b.id
}