variable "rgroup_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "location" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_name2" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "ssh_private_key" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "rg_dependency" {}

variable "availability_set_id" {
  type = string
}
