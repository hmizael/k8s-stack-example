<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.63.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |

### Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.63.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.node_pools](https://registry.terraform.io/providers/hashicorp/azurerm/3.63.0/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.63.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.snet](https://registry.terraform.io/providers/hashicorp/azurerm/3.63.0/docs/data-sources/subnet) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ARM_CLIENT_ID"></a> [ARM\_CLIENT\_ID](#input\_ARM\_CLIENT\_ID) | (Required) The Client ID which should be used | `any` | n/a | yes |
| <a name="input_ARM_CLIENT_SECRET"></a> [ARM\_CLIENT\_SECRET](#input\_ARM\_CLIENT\_SECRET) | (Required) The Client Secret which should be used | `any` | n/a | yes |
| <a name="input_ARM_SUBSCRIPTION_ID"></a> [ARM\_SUBSCRIPTION\_ID](#input\_ARM\_SUBSCRIPTION\_ID) | (Required) The Subscription ID which should be used | `any` | n/a | yes |
| <a name="input_ARM_TENANT_ID"></a> [ARM\_TENANT\_ID](#input\_ARM\_TENANT\_ID) | (Required) The Tenant ID which should be used | `any` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Version of Kubernetes used for the Agents. If not specified, the default node pool will be created with the version specified by kubernetes\_version | `string` | `"1.26.3"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region into which the cluster should be deployed | `string` | `"East US"` | no |
| <a name="input_network"></a> [network](#input\_network) | n/a | `map` | <pre>{<br>  "snet_name": "snet-hub-aks",<br>  "vnet_name": "vnet-hub"<br>}</pre> | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource Group to AKS resources | `string` | `"rg-hub"` | no |
| <a name="input_system_node_pool_config"></a> [system\_node\_pool\_config](#input\_system\_node\_pool\_config) | Node count for AKS System NodePool (default=1); Enabling this option will taint default node pool with CriticalAddonsOnly=true:NoSchedule taint | `map(any)` | <pre>{<br>  "node_count": 1,<br>  "only_critical_addons_enabled": false,<br>  "vm_size": "Standard_D4as_v5"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for all resources | `map` | <pre>{<br>  "env": "hub",<br>  "project": "k8s-stack-example",<br>  "region": "east_us",<br>  "short_region": "eu",<br>  "terraform": true,<br>  "tier": "container"<br>}</pre> | no |
| <a name="input_user_node_pools"></a> [user\_node\_pools](#input\_user\_node\_pools) | n/a | `map` | `{}` | no |
<!-- END_TF_DOCS -->