# Terraform_AddVMToAzureBackup
Practice for me writing Terraform stuff: It will add a VM of a specified ID to Azure Backup, creating a vault and backup policy if necessary

To use it, you just have to provide it a service principal and the required parameters for that, as detailed here: https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_certificate.html
You also need to pass it a VM ID. You get that from the Azure Portal -> VM pane -> Properties -> ARM ID. Or you could do it via Powershell. I suppose you could make a VM block in the script to and retrieve from that.
