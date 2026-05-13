terraform {
  required_version = ">= 1.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.100"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm_prod" {
  source = "../../modules/vm"

  vm_name   = var.vm_name
  zone      = var.zone
  cores     = var.cores
  memory    = var.memory
  disk_size = var.disk_size
  subnet_id = var.subnet_id
  ssh_key   = var.ssh_key
  image_id  = var.image_id
}