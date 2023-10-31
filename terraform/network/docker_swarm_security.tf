locals {
  name = "docker-swarm-security"
  description = "Группа безопасности для Docker кластера"
}

resource "yandex_vpc_security_group" "docker-swarm-security" {
  name        = "${local.name}"
  description = "${local.description}"
  network_id  = yandex_vpc_network.network-01.id

  labels = {
    sg_name = "${local.name}"
  }

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port      = ingress.value
      to_port        = ingress.value
      protocol       = "TCP"
      v4_cidr_blocks = ["0.0.0.0/0"]
      description    = "Разрешено входящее соединение для балансировки запросов от Network Load Balancer до Traefik"
    }
  }

  ingress {
    from_port      = 0
    to_port        = 65535
    protocol       = "ANY"
    v4_cidr_blocks = ["10.2.0.0/16"]
    description    = "Разрешено входящее соединение по всем порта внутри Docker кластера"
  }

  ingress {
    from_port      = 22
    to_port        = 22
    protocol       = "TCP"
    v4_cidr_blocks = ["10.3.0.0/16"]
    description    = "Разрешено соединение по SSH с bastion-host до Docker кластера"
  }

  egress {
    from_port      = 0
    to_port        = 65535
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    description    = "Разрешен исходящий трафик до интернета через NAT"
  }

}
