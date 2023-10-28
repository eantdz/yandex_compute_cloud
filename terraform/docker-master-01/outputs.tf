output "external_ip" {
  value = yandex_compute_instance.docker-master-01.network_interface.0.nat_ip_address
}