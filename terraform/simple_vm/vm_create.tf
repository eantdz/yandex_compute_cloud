### Starting manifest
resource "yandex_compute_instance" "vm-01" {
  name        = "vm-01"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    core_fraction = 5
    cores         = 2
    memory        = 2
  }

  scheduling_policy {
    preemptible = "true"
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 20
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.vm-subnet-a.id
    nat = "true"
    nat_ip_address = "84.201.133.171"
  }

  metadata = {
    ssh-keys  = "svc-wsl:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("./user-meta.txt")}"
  }

}
