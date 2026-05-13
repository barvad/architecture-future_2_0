variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud zone"
  type        = string
}

variable "cores" {
  description = "CPU cores"
  type        = number
}

variable "memory" {
  description = "RAM size in GB"
  type        = number
}

variable "disk_size" {
  description = "Additional disk size in GB"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "ssh_key" {
  description = "SSH public key"
  type        = string
}

variable "image_id" {
  description = "Ubuntu image ID"
  type        = string
}