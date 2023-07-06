resource "azurerm_kubernetes_cluster" "this" {
  name                                = "aks-target"
  location                            = data.azurerm_resource_group.rg.location
  resource_group_name                 = data.azurerm_resource_group.rg.name
  kubernetes_version                  = var.kubernetes_version
  dns_prefix                          = "akstarget"
  azure_policy_enabled                = false
  http_application_routing_enabled    = false
  oidc_issuer_enabled                 = false
  open_service_mesh_enabled           = false
  tags                                = var.tags

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                         = "system"
    os_sku                       = "Mariner"
    node_count                   = var.system_node_pool_config.node_count
    vm_size                      = var.system_node_pool_config.vm_size
    only_critical_addons_enabled = var.system_node_pool_config.only_critical_addons_enabled
    type                         = "VirtualMachineScaleSets"
    zones                        = ["1", "2", "3"]
    vnet_subnet_id               = data.azurerm_subnet.snet.id
    max_pods                     = 250
    tags                         = var.tags
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "Overlay"
    ebpf_data_plane     = "cilium"
  }
}