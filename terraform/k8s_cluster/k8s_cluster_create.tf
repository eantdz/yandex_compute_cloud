### Kubernetes master
resource "yandex_kubernetes_cluster" "kube-cluster-01" {
  name        = "kube-cluster-01"
  description = "first k8s cluster"

  network_id = yandex_vpc_network.k8s-network.id

  master {
    version = "1.24"
    zonal {
      zone      = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.k8s-subnet-a.id
    }

    public_ip = true

    maintenance_policy {
      auto_upgrade = true

      maintenance_window {
        start_time = "10:00"
        duration   = "3h"
      }
    }

  }

  service_account_id      = yandex_iam_service_account.k8s-editor.id
  node_service_account_id = yandex_iam_service_account.k8s-img-puller.id

  release_channel         = "RAPID"
  network_policy_provider = "CALICO"

### Depends on folder iam binding to svc accounts
  depends_on = [
    yandex_resourcemanager_folder_iam_binding.k8s-editor,
    yandex_resourcemanager_folder_iam_binding.k8s-img-puller
  ]

}

### Node group
resource "yandex_kubernetes_node_group" "kube-nodes-01" {
  cluster_id  = yandex_kubernetes_cluster.kube-cluster-01.id
  name        = "kube-nodes-01"
  description = "first k8s nodes group"
  version     = "1.24"

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat        = true
      subnet_ids = ["${yandex_vpc_subnet.k8s-subnet-a.id}"]
    }

    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    scheduling_policy {
      preemptible = true
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    fixed_scale {
      size = 1
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-a"
    }
  }

  maintenance_policy {
    auto_upgrade = true
    auto_repair  = true

    maintenance_window {
      day        = "monday"
      start_time = "10:00"
      duration   = "3h"
    }

    maintenance_window {
      day        = "friday"
      start_time = "10:00"
      duration   = "4h30m"
    }
  }
}
