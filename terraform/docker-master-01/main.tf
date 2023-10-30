# Environment
locals {
  core_fraction  = "20"
  cores          = "2"
  memory         = "2"
  boot_disk_size = "20"
  boot_disk_type = "network-hdd"
  ip_address     = "10.2.0.10"
}

# Compute instance
resource "yandex_compute_instance" "docker-master-01" {
  name        = "docker-master-01"
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

  # Docker node network settings
  network_interface {
    subnet_id          = data.yandex_vpc_subnet.network-01-subnet-a.id
    ip_address         = local.ip_address
    nat                = "true"
    security_group_ids = ["${data.yandex_vpc_security_group.docker-swarm-security.id}"]
  }

  # Cloud-init settings
  metadata = {
    user-data = "${file("./user-meta.txt")}"
  }

}
