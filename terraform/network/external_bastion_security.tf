resource "yandex_vpc_security_group" "external-bastion-security" {
  name        = "external-bastion-security"
  description = "Security group for bastion-host"
  network_id  = yandex_vpc_network.network-01.id

  labels = {
    sg_name = "external-bastion-security"
  }

  # Allow SSH connections from Ethernet (Change port in the future...)
  ingress {
    from_port      = 22
    to_port        = 22
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  # External traffic to Ethernet over NAT
  egress {
    from_port      = 0
    to_port        = 65535
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

}
