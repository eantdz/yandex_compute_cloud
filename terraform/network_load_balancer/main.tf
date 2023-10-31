locals {
  listener_name       = "docker-swarm-nlb-listener"
  external_ip_address = "158.160.124.200"
  port                = "80"
}

resource "yandex_lb_network_load_balancer" "docker-swarm-nlb" {
  name = "docker-swarm-nlb"

  listener {
    name = local.listener_name
    port = local.port
    external_address_spec {
      ip_version = "ipv4"
      address    = local.external_ip_address
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.docker-swarm-nlb-tg.id

    healthcheck {
      name = "tcp"
      tcp_options {
        port = 80
      }
    }
  }
}
