variable "location" {
  description = "The Azure region into which the cluster should be deployed"
  default     = "East US"
}

variable "ARM_CLIENT_ID" {
  description = "(Required) The Client ID which should be used"
}

variable "ARM_CLIENT_SECRET" {
  description = "(Required) The Client Secret which should be used"
}

variable "ARM_TENANT_ID" {
  description = "(Required) The Tenant ID which should be used"
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "(Required) The Subscription ID which should be used"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes used for the Agents. If not specified, the default node pool will be created with the version specified by kubernetes_version"
  default     = "1.26.3"
}

variable "resource_group" {
  description = "Resource Group to AKS resources"
  default     = "rg-hub"
}

variable "network" {
  default = {
    "snet_name" = "snet-hub-aks"
    "vnet_name" = "vnet-hub"
  }
}

variable "system_node_pool_config" {
  description = "Node count for AKS System NodePool (default=1); Enabling this option will taint default node pool with CriticalAddonsOnly=true:NoSchedule taint"
  type        = map(any)
  default = {
    node_count                   = 1
    vm_size                      = "Standard_D4as_v5"
    only_critical_addons_enabled = false
  }
}

variable "user_node_pools" {
  default = {
  }
}

variable "tags" {
  description = "Tags for all resources"
  default = {
    "env"          = "hub"
    "project"      = "k8s-stack-example"
    "terraform"    = true
    "tier"         = "container"
    "region"       = "east_us"
    "short_region" = "eu"
  }
}