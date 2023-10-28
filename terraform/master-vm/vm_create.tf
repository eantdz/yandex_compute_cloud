### Starting manifest
resource "yandex_compute_instance" "master-vm" {
  name        = "master-vm"
  platform_id = "standard-v1"
  zone        = var.default_zone

  resources {
    core_fraction = 20
    cores         = 1
    memory        = 1
  }

  scheduling_policy {
    preemptible = "false"
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
    nat_ip_address = yandex_vpc_address.master-vm-external_ipv4_addr.address
  }

  metadata = {
    ssh-keys  = "svc-wsl:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("./user-meta.txt")}"
  }

}
