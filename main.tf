provider "azurerm" {
  version = "~> 1.27"
  subscription_id = "${var.SUBID}"
  client_id = "${var.CLIENTID}"
  client_certificate_path ="${var.CERTPATH}"
  client_certificate_password = "${var.CERTPASS}"
  tenant_id = "${var.TENANTID}"

}

resource "azurerm_resource_group" "terraform_RG" {
  name = "${var.resource_group_name}"
  location = "eastus"
}


resource "azurerm_recovery_services_vault" "terraform_backup_vault" {
  name                = "TerraformBackupVault"
  location            = "EastUS"
  resource_group_name = "${azurerm_resource_group.terraform_RG.name}"
  sku                 = "Standard"
}


resource "azurerm_backup_policy_vm" "default_policy" {
  name                = "terraformvaultpolicy"
  resource_group_name = "${azurerm_resource_group.terraform_RG.name}"
  recovery_vault_name = "TerraformBackupVault"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }
  retention_daily {
    count = 7
  }
}

resource "azurerm_backup_protected_vm" "vm_to_protect" {
  resource_group_name = "${azurerm_resource_group.terraform_RG.name}"
  recovery_vault_name = "${azurerm_recovery_services_vault.terraform_backup_vault.name}"
  source_vm_id        = "${var.vm_id}"
  backup_policy_id    = "${azurerm_backup_policy_vm.default_policy.id}"
}
