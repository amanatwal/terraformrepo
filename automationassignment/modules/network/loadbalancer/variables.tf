variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "linux_vm1_nic_id" {
  description = "The ID of the network interface for the first Linux VM."
  type        = string
}

variable "linux_vm2_nic_id" {
  description = "The ID of the network interface for the second Linux VM."
  type        = string
}
