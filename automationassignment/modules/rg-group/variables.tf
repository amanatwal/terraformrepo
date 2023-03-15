variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to be created."
  default     = "n01261681-assignment1-RG"
}

variable "resource_group_location" {
  type        = string
  description = "The location where the resource group will be created."
  default     = "eastus"
}

variable "project_tag" {
  type        = string
  description = "The value of the 'Project' tag for the resource group."
  default     = "Automation Project – Assignment 1"
}

variable "name_tag" {
  type        = string
  description = "The value of the 'Name' tag for the resource group."
  default     = "amandeep.kaur"
}

variable "expiration_date_tag" {
  type        = string
  description = "The value of the 'ExpirationDate' tag for the resource group."
  default     = "2023-06-30"
}

variable "environment_tag" {
  type        = string
  description = "The value of the 'Environment' tag for the resource group."
  default     = "Lab"
}
