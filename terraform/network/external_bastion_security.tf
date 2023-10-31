locals {
  name        = "external-bastion-security"
  description = "Группа безопасности для внешнего bastion-host"
}

resource "yandex_vpc_security_group" "external-bastion-security" {
  name        = local.name
  description = local.description
  network_id  = yandex_vpc_network.network-01.id

  labels = {
    sg_name = "${local.name}"
  }

  ingress {
    from_port      = 22
    to_port        = 22
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    description    = "Разрешено входящее соединение по SSH из интернета"
  }

  egress {
    from_port      = 0
    to_port        = 65535
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    description    = "Разрешен исходящий трафик до интернета через NAT"
  }

}
