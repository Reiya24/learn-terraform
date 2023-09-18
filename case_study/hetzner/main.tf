terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.42.1"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "terraform_ssh_key" {
  name       = "terraform-ssh-key"
  public_key = var.ssh_key
}

resource "hcloud_server" "terraform_server" {
  name        = "terraform"
  image       = "ubuntu-22.04"
  server_type = "cx11"
  ssh_keys    = [hcloud_ssh_key.terraform_ssh_key.id]

  labels = {
    type = "terraform"
  }

}