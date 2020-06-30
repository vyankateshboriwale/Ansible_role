provider "google" {
 credentials = "/home/v_boriwale/infosys-gcp-demo-project.json"
 project = "infosys-gcp-demo-project"
 region = "us-west1"
}

 resource "google_compute_instance" "default" {
 name         = "test"
 machine_type = "f1-micro"
 zone = "us-west1-a"

 boot_disk {
  initialize_params {
   image = "centos-cloud/centos-7"
  }

 }

 network_interface {
  network = "default"
        access_config {}

 }

 metadata = {
        ssh-keys = "v_boriwale:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+Rem5zuzgx0myt+CI/IW36qaNbRJlJ3Hycnm3dpjif4YAxcJZyuZFsgdh9qRBcFbCogl6P8gHG2/WEDcS7RtUfrGeZy6OwWa+HgVaEODtdgW8ZTPVdYF+r+V0lHNssysGRF+7Z2nQm6PM0bwStCs3Dq0a1CnZrbZ/QO2WDPRN89jTPQeC6fDHLR+PzOOXZyzdwze4Mab44C15fD4QP8L2uiJT6Qkljq7X+2PzrA6+ecCl/i2KXWMpN6jYmrByYT7y3Gw12m/0o039TMSiFtl6FDzyDYX4MeVnpedJYuI7eNVtpqmShOZx6GcwzWTvj9zkPkDJEWU5KrbMvuEzb/qV v_boriwale@infra-poc-server"
        }
}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
    }
