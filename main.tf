locals {
  #cluster_names = ["Saj","Paul","Ladi","Emmanuel","Douglas","Jade","Ola"]
  whatever= ["bob","smith","bart","homer"]
}

resource "azurerm_resource_group" "classwork2509" {
  name     = "rg-${var.convention}"
  location = var.location
}


resource "azurerm_storage_blob" "classwork2509" {
  for_each            = { for brap in local.whatever : brap => brap }  
  name                   = "$(each.key)"
  storage_account_name   = azurerm_storage_account.classwork2509.name
  storage_container_name = azurerm_storage_container.classwork2509.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
