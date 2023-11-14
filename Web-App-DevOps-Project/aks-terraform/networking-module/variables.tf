variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
  default = "aks-resource-group"
}

variable "location" {
  description = "The location/region where the virtual network is created."
  type        = string
  default = "eastus"
}

variable "vnet_address_space" {
  description = "The address space that is used the virtual network."
  type        = list(string)
  default = ["10.0.0.0/8"]
}

