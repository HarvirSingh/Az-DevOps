variable "nic_name"{
    description = "nic ka naam"
    type = string
}
 variable "nic_location"{
    description = "nic ki location"
    type = string
  }
variable "resource_group_name"{
    description = "The name of the resource group"
    type = string
 }
variable "vm_name" {   
  description = "VM ka naam"
  type = string
  }
variable "vm_size"{ 
    description = "The size of the virtual machine"
    type = string
  }
variable "admin_username"{
    description = "Admin user for VM"
    type = string
  }
variable "admin_password"{
    description = "VM ke admin user ka password"
    type = string
  }
variable "image_publisher"{
    description = "The publisher of the image to use for the virtual machine"
    type = string
  }
variable "image_offer"{ 
    description = "The offer of the image to use for the virtual machine"
    type = string
}
variable "image_sku"{
    description = "The SKU of the image to use for the virtual machine"
    type = string
  }
variable "image_version"{
    description = "VM ki image ka version"
    type = string
  }
  variable "vm_location"{
    description = "VM location"
    type = string
    }
variable "subnet_name"{
    description = "subnet ka naam"
    type = string
}
variable "virtual_network_name"{
    description = "Vnet name"
    type = string
 }
variable "pip_name"{
    description = "Public IP ka naam"
    type    =  string
 }