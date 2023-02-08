data "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  resource_group_name = var.aks_rg
}

data "azurerm_resource_group" "rgaks" {
  name = data.azurerm_kubernetes_cluster.aks.resource_group_name
}

data "azurerm_resource_group" "rgaksnodepool" {
  name = data.azurerm_kubernetes_cluster.aks.node_resource_group
}