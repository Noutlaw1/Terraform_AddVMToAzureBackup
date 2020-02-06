variable "resource_group_name" {
	type = "string"
	default = "terraform-group"
	description = "Terraform RG for testing"
}

variable "vm_id" {
  type = "string"
}

variable "SUBID"  {
  type = string
}

variable "CLIENTID" {
  type = string
}

variable "CERTPATH" {
  type= string
}

variable "CERTPASS" {
  type = string
}

variable "TENANTID" {
  type = string
}

