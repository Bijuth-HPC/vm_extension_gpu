variable "prefix" {
  description = "The Prefix used for all VM resources"
  default = "tf_vm"
}


variable "location" {
  description = "The Azure Region in which to run vm"
  default = "eastus"
}

variable "machine_type" {
  description = "The Azure Machine Type for the  VM"
  default = "Standard_NC4as_T4_v3"
}

#variable "tf_vm_dns_label" {
#  description = "An optional short public DNS name/label for the VM"
#}

variable "os_disk_size_gb" {
  description = "The size of the OS disk for the  VM (should be >= 128GB and >= 256 for large clusters)"
  default = "200"
}

variable "tf_vm_virtual_machine_name" {
    description =  "The private hostname for the  VM"
    default = "centos-hpc"
}

variable "tf_vm_username" {
  description = "The username for the initial vm Admin user and VM user"
  default = "bthankachen"
}

variable "tf_vm_password" {
  description = "The initial password for the vm Admin user"
  default = "administrator"
}
variable "tf_vm_user_publickey" {
  description = "The public key for the initial Admin user and VM user"
  default ="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEArr3lMJ5PibWi5C2AeFTEQOR0ubU03cZ8CqqJ8eTNYax4lDh4MDVpHAT5ZkBOYBkqYpZR/6Xh1wdcG4dl5fShm1AapK5Bv0jaTZeDlXUVlQkmfbJkAd30HyrevkLcUUwN9kx9AuuhS5G21cMiKYA1NJIPv6Roc2PtsO6ELaP9lRyxxHikOneLZd3HussGniHjy9s8T/uuIJQH57w4FQ7ul5VMHUZMplIuRM6oJ7zcF3aGLakLtLA4UOeGISj0YIOKi4sQXkOKqZmh4P1MNLTn4nAAUGPMSbs8xDKyhsoPolGl1/2d6HDIV0JtVF0lE8Sy9PU3andg3y3GKf8qIsw3Vw== rsa-key-20200917"
}
