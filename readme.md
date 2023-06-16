# Module - AKS RBAC
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Important: This module assumes that you are using Azure AD for authentication. 

Module developed to grant permissions to groups and service accounts on AKS. The default use case only grantees reader permissions, because it assumes that you are using the Kubernetes RBAC to give permissions on resources of the cluster.

Permissions:

- Reader on AKS resource group
- Reader on AKS managed resource group. Usually this resource group name starts with MC_***
- Azure Kubernetes Service Cluster User Role

If you are going to use the Azure RBAC, you can configure the following permissions individually:

- Azure Kubernetes Service Cluster Admin Role
- Azure Kubernetes Service Cluster Monitoring User
- Azure Kubernetes Service Contributor Role
- Azure Kubernetes Service RBAC Admin
- Azure Kubernetes Service RBAC Cluster Admin
- Azure Kubernetes Service RBAC Reader
- Azure Kubernetes Service RBAC Writer

Note: The use of Kubernetes RBAC facilitates when you work with multi cloud service providers (CSP), because you don't have to define all needed privileges and scopes to be applied on the CSP's console. 

Using the Kubernetes RBAC, you have only to grant reader permissions on the CSP's console. The Kubernetes roles/clusterroles can be used in all CSPs.

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.4.6            | 3.60.0          |
## Specifying a version

To avoid that your code get updates automatically, is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can define the version of the module.

Note: The `?ref=***` refers a tag on the git module repo.
## Default use case
```hcl
module "rbac_azure_ad_groups" {
  source = "git::https://github.com/danilomnds/terraform-azurerm-aks-rbac?ref=v1.0.0"
  aks_name = <name of AKS cluster>
  aks_rg = <name of AKS resource group>
  role_assignment = {
    <group name> = {
      # command to get the objectId of the azure group az ad group show --group <group name> --query objectId --out tsv
      principal_id = <group object id>
      scope_namespace = <opcional. Ex: ${azurerm_kubernetes_cluster.aks-dev-ecom.id}/namespaces/ecommerce>
    }
    <group name 2> = {      
      principal_id = <group object id>
      scope_namespace = <opcional. Ex: ${azurerm_kubernetes_cluster.aks-dev-ecom.id}/namespaces/ecommerce>
    }
  }  
}
```

## Custom use case
```hcl
module "rbac_azure_ad_groups" {
  source = "git::https://github.com/danilomnds/terraform-azurerm-aks-rbac?ref=v1.0.0"
  aks_name = <name of AKS cluster>
  aks_rg = <name of AKS resource group>  
  # with this option then default permissions will be granted plus the "Azure Kubernetes Service Cluster Admin Role". All bool vars work in the same way.
  aks_rbac_admin = true
  role_assignment = {
    <group name> = {
      # command to get the objectId of the azure group az ad group show --group <group name> --query objectId --out tsv
      principal_id = <group object id>
      scope_namespace = <opcional. Ex: ${azurerm_kubernetes_cluster.aks-dev-ecom.id}/namespaces/ecommerce>
    }
  }
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aks_name | AKS cluster name | `string` | n/a | `Yes` |
| aks_rg | AKS resource group name | `string` | n/a | `Yes` |
| role_assignment | possible values for each assignment on Azure (full list of parameters below) | `string` | n/a | `Yes` |
| aks_contributor_role | Grants access to read and write AKS clusters | `bool` | `false` | No |
| aks_rbac_admin | Lets you manage all resources under cluster/namespace, except update or delete resource quotas and namespaces | `bool` | `false` | No |
| aks_rbac_cluster_admin | Lets you manage all resources in the cluster | `bool` | `false` | No |
| aks_rbac_reader | Allows read-only access to see most objects in a namespace. It does not allow viewing roles or role bindings. This role does not allow viewing Secrets, since reading the contents of Secrets enables access to ServiceAccount credentials in the namespace, which would allow API access as any ServiceAccount in the namespace (a form of privilege escalation). Applying this role at cluster scope will give access across all namespaces | `bool` | `false` | No |
| aks_rbac_writer | Allows read/write access to most objects in a namespace.This role does not allow viewing or modifying roles or role bindings. However, this role allows accessing Secrets and running Pods as any ServiceAccount in the namespace, so it can be used to gain the API access levels of any ServiceAccount in the namespace. Applying this role at cluster scope will give access across all namespaces | `bool` | `false` | No |

## List of parameters for that can be defined in each assignment

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | A unique UUID/GUID for this role assignment - one will be generated if not specified | `string` | n/a | No |
| principal_id | The ID of the principal (user, group or service principal) to assign the role definition to | `string` | n/a | `Yes` |
| condition | The condition that limits the resources that the role can be assigned to | `string` | n/a | No |
| condition_version | The version of the condition. Possible values are 1.0 or 2.0 | `string` | n/a | No |
| delegated_managed_identity_resource_id | The delegated Azure Resource Id which contains a Managed Identity | `string` | n/a | No |
| description | The description for this role assignment | `string` | n/a | No |
| skip_service_principal_aad_check | skip the Azure AD account verification | `bool` | `false` | No |

## Documentation
Terraform Role Assignment: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment)<br>