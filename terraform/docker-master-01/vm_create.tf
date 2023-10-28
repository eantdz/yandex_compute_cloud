### VM
resource "yandex_compute_instance" "docker-master-01" {
  name        = "docker-master-01"
  platform_id = "standard-v1"
  zone        = var.default_zone

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  scheduling_policy {
    preemptible = "false"
  }

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id      = data.yandex_vpc_subnet.network-01-subnet-a.id
    nat            = "true"
    nat_ip_address = var.external_ip
  }

  metadata = {
    ssh-keys  = "svc-wsl:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("./user-meta.txt")}"
  }

}
