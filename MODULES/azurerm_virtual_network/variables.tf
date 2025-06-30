variable "virtual_network_name" {
    description = "value of the virtual network name"
    type       = string
}
variable "virtual_network_location" {
    description = "value of the virtual network location"
    type       = string
}
    variable "resource_group_name"{
    description = "value of the resource group name"
     type = string
     }
     variable "address_space"{
        description = "value of the address space"
     type = list(string)
          }