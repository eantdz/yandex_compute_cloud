resource "yandex_vpc_security_group" "docker-swarm-security" {
  name        = "docker-swarm-security"
  description = "Security group for Docker Swarm cluster"
  network_id  = "${yandex_vpc_network.network-01.id}"

  labels = {
    sg_name = "docker-swarm-security"
  }

  dynamic "ingress" {
    for_each = ["2376", "2377", "7946", "4789"]

    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "TCP"
      v4_cidr_blocks = ["10.2.0.0/16"]
    }
  }

  ingress {
    from_port = 0
    to_port = 22
    protocol = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
