resource "azurerm_role_assignment" "rgaksreader" {
  for_each                               = var.role_assignment
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_resource_group.rgaks.id
  role_definition_name                   = "Reader"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
  lifecycle {
    ignore_changes = [
      scope
    ]
  }
}

resource "azurerm_role_assignment" "rgnodeaksreader" {
  for_each                               = var.role_assignment
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_resource_group.rgaksnodepool.id
  role_definition_name                   = "Reader"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
  lifecycle {
    ignore_changes = [
      scope
    ]
  }
}

resource "azurerm_role_assignment" "aksuserrole" {
  for_each                               = var.role_assignment
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service Cluster User Role"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
  lifecycle {
    ignore_changes = [
      scope
    ]
  }
}

resource "azurerm_role_assignment" "aks_admin_role" {
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.aks_admin_role
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service Cluster Admin Role"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "aks_monitoring_user" {
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.aks_monitoring_user
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service Cluster Monitoring User"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "aks_contributor_role" {
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.aks_contributor_role
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service Contributor Role"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "aks_rbac_admin" {
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.aks_rbac_admin
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service RBAC Admin"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "aks_rbac_cluster_admin" {
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.aks_rbac_cluster_admin
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "aks_rbac_reader" {
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.aks_rbac_reader
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service RBAC Reader"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}

resource "azurerm_role_assignment" "aks_rbac_writer" {
  for_each = {
    for k, v in var.role_assignment : k => v
    if var.aks_rbac_writer
  }
  name                                   = lookup(each.value, "name", null)
  scope                                  = data.azurerm_kubernetes_cluster.aks.id
  role_definition_name                   = "Azure Kubernetes Service RBAC Writer"
  principal_id                           = lookup(each.value, "principal_id", null)
  condition                              = lookup(each.value, "condition", null)
  condition_version                      = lookup(each.value, "condition_version", null)
  delegated_managed_identity_resource_id = lookup(each.value, "delegated_managed_identity_resource_id", null)
  description                            = lookup(each.value, "description", null)
  skip_service_principal_aad_check       = lookup(each.value, "skip_service_principal_aad_check", null)
}