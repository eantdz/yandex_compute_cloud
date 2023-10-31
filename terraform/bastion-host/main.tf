# Environment
locals {
  core_fraction  = "20"
  cores          = "2"
  memory         = "1"
  boot_disk_size = "20"
  boot_disk_type = "network-hdd"
  nat_ip_address = "51.250.79.208"
}

# Compute instance
resource "yandex_compute_instance" "bastion-host" {
  name        = "bastion-host"
  platform_id = "standard-v1"
  zone        = var.default_zone

  resources {
    core_fraction = local.core_fraction
    cores         = local.cores
    memory        = local.memory
  }

  scheduling_policy {
    preemptible = "false"
  }

  allow_stopping_for_update = true

  # Disk settings
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = local.boot_disk_size
      type     = local.boot_disk_type
    }
  }
  # Bastion network settings
  network_interface {
    subnet_id          = data.yandex_vpc_subnet.network-01-subnet-b.id
    nat                = "true"
    nat_ip_address     = local.nat_ip_address
    security_group_ids = ["${data.yandex_vpc_security_group.external-bastion-security.id}"]
  }

  # Cloud-init settings
  metadata = {
    user-data = "${file("./user-meta.txt")}"
  }

}
