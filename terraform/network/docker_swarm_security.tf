resource "yandex_vpc_security_group" "docker-swarm-security" {
  name        = "docker-swarm-security"
  description = "Security group for Docker Swarm cluster"
  network_id  = yandex_vpc_network.network-01.id

  labels = {
    sg_name = "docker-swarm-security"
  }

  # Connections between docker master/slave and NFS nodes
  ingress {
    from_port      = 0
    to_port        = 65535
    protocol       = "ANY"
    v4_cidr_blocks = ["10.2.0.0/16"]
  }

  # Allow SSH connections from bastion-host
  ingress {
    from_port      = 22
    to_port        = 22
    protocol       = "TCP"
    v4_cidr_blocks = ["10.3.0.0/16"]
  }

  # External traffic to Ethernet over NAT
  egress {
    from_port      = 0
    to_port        = 65535
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

}
