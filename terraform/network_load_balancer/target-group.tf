resource "yandex_lb_target_group" "docker-swarm-nlb-tg" {
  name      = "docker-swarm-nlb-tg"
  region_id = "ru-central1"

  target {
    subnet_id = data.yandex_vpc_subnet.network-01-subnet-a.id
    address   = data.yandex_compute_instance.docker-master-01.network_interface.0.ip_address
  }

  target {
    subnet_id = data.yandex_vpc_subnet.network-01-subnet-a.id
    address   = data.yandex_compute_instance.docker-slave-01.network_interface.0.ip_address
  }
}
