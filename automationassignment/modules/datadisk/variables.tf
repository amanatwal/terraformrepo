variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "linux_vm_ids" {
  type = list(string)
}

variable "windows_vm_id" {
  type = string
}
