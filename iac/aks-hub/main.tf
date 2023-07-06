resource "azurerm_kubernetes_cluster" "this" {
  name                                = "aks-hub"
  location                            = data.azurerm_resource_group.rg.location
  resource_group_name                 = data.azurerm_resource_group.rg.name
  kubernetes_version                  = var.kubernetes_version
  dns_prefix                          = "akshub"
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

resource "azurerm_kubernetes_cluster_node_pool" "node_pools" {
  for_each = var.user_node_pools

  name                  = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = each.value.vm_size
  zones                 = ["1", "2", "3"]
  max_pods              = 250
  os_type               = "Linux"
  mode                  = "User"
  enable_auto_scaling   = each.value.enable_auto_scaling
  min_count             = each.value.enable_auto_scaling == true ? each.value.min_count : null
  max_count             = each.value.enable_auto_scaling == true ? each.value.max_count : null
  node_count            = each.value.enable_auto_scaling == false ? each.value.node_count : null
  node_taints           = each.value.node_taints
  vnet_subnet_id        = data.azurerm_subnet.snet.id
  tags                  = var.tags
  node_labels = {
    "type" = "${each.key}"
  }
}