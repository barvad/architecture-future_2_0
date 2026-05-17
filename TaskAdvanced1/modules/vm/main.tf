resource "yandex_compute_disk" "vm_disk" {
  name = "${var.vm_name}-disk"
  type = "network-hdd"
  size = var.disk_size
  zone = var.zone
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = "standard-v1"
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 10
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.vm_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }
}