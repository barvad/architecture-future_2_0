output "vm_id" {
  description = "VM ID"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "VM name"
  value       = yandex_compute_instance.vm.name
}

output "internal_ip" {
  description = "Internal IP"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip" {
  description = "External IP"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "disk_id" {
  description = "Additional disk ID"
  value       = yandex_compute_disk.vm_disk.id
}