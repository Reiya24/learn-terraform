terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx_alpine" {
  name         = "nginx:alpine"
  keep_locally = true
}

variable "env_config" {
  type = list(object({
    key        = string
    value      = string
    is_enabled = bool
  }))


  default = [{
    key        = "SECRET_KEY"
    value      = "aaabbcc"
    is_enabled = true
    }, {
    key        = "order_svc_host"
    value      = "blabla.order.local"
    is_enabled = false
  }]
}

resource "docker_container" "nginx" {
  count = 3
  image = docker_image.nginx_alpine.image_id

  name = "nginx-${count.index}"

  ports {
    external = 8080 + count.index
    internal = 80
  }

  env = [for e in var.env_config : "${upper(e.key)}=${e.value}"]


}


output "list_ip_container" {
  value       = [for con in docker_container.nginx : one(con.network_data).ip_address]
  description = "semua alamat IP container yang dibuat"
}
/*
for expression digunakan untuk mengambil suatu data / transform data dari sekumpulan
data yang kompleks
*/

