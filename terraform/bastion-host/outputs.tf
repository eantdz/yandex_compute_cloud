output "external_ip" {
  value = yandex_compute_instance.bastion-host.network_interface.0.nat_ip_address
}