terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id       = "bab5a578-0aeb-4606-8395-e361c475fef0"
  client_secret   = "V3X8Q~zRj2Je5Wbg2VhLt~2IdXeHk.dMukvfEdmr"
  subscription_id = "9ea9e653-eb83-42fa-9328-d084a406412a"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

module "networking" {
  source = "./networking-module"

  resource_group_name = "networking-resource-group"
  location            = "UK South"
  vnet_address_space  = ["10.0.0.0/16"]
}

module "aks_cluster" {
    source = "./aks-cluster-module"

    resource_group_name         = module.networking.networking_resource_group_name
    dns_prefix                  = "myaks-project"
    kubernetes_version          = "1.26.6"
    service_principal_client_id = "bab5a578-0aeb-4606-8395-e361c475fef0"
    service_principal_secret    = "V3X8Q~zRj2Je5Wbg2VhLt~2IdXeHk.dMukvfEdmr"
    vnet_id                     = module.networking.vnet_id
    control_plane_subnet_id     = module.networking.control_plane_subnet_id
    worker_node_subnet_id       = module.networking.worker_node_subnet_id
    aks_cluster_name            = "my-aks-cluster"
    cluster_location            = "UK South"
}