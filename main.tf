locals {
  #cluster_names = ["Saj","Paul","Ladi","Emmanuel","Douglas","Jade","Ola"]
  whatever= ["bob","smith","bart","homer"]
}

resource "azurerm_resource_group" "classwork2509" {
  name     = "rg-${var.convention}"
  location = var.location
}

resource "azurerm_storage_account" "classwork250908" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.classwork2509.name
  location                 = azurerm_resource_group.classwork2509.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "classwork250907" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "classwork2509" {
  for_each            = { for brap in local.whatever : brap => brap }  
  name                   = "$(each.key)"
  storage_account_name   = azurerm_storage_account.classwork250908.name
  storage_container_name = azurerm_storage_container.classwork250907.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
