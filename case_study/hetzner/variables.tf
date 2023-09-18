variable "hcloud_token" {
  default     = "ubuntu-18.04"
  description = "input hetzner token"
  sensitive   = true
}

variable "ssh_key" {
  description = "input ssh-key"
  sensitive   = true
}