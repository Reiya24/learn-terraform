variable "hcloud_token" {
  sensitive = true
}

variable "server_list" {
  type = list(string)
}

variable "firewall_port" {
  type = list(string)
}

variable "ssh_key" {
  type = map(string)
}