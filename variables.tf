variable "aks_name" {
  type = string
}

variable "aks_rg" {
  type = string
}

variable "role_assignment" {
  type = map(map(string))
}

variable "aks_admin_role" {
  description = "List cluster admin credential action"
  type        = bool
  default     = false
}

variable "aks_monitoring_user" {
  description = "List cluster monitoring user credential action"
  type        = bool
  default     = false
}

variable "aks_contributor_role" {
  description = "Grants access to read and write Azure Kubernetes Service clusters"
  type        = bool
  default     = false
}

variable "aks_rbac_admin" {
  description = "Lets you manage all resources under cluster/namespace, except update or delete resource quotas and namespaces."
  type        = bool
  default     = false
}

variable "aks_rbac_cluster_admin" {
  description = "Lets you manage all resources in the cluster"
  type        = bool
  default     = false
}

variable "aks_rbac_reader" {
  description = "Allows read-only access to see most objects in a namespace. It does not allow viewing roles or role bindings. This role does not allow viewing Secrets, since reading the contents of Secrets enables access to ServiceAccount credentials in the namespace, which would allow API access as any ServiceAccount in the namespace (a form of privilege escalation). Applying this role at cluster scope will give access across all namespaces."
  type        = bool
  default     = false
}

variable "aks_rbac_writer" {
  description = "Allows read/write access to most objects in a namespace.This role does not allow viewing or modifying roles or role bindings. However, this role allows accessing Secrets and running Pods as any ServiceAccount in the namespace, so it can be used to gain the API access levels of any ServiceAccount in the namespace. Applying this role at cluster scope will give access across all namespaces."
  type        = bool
  default     = false
}