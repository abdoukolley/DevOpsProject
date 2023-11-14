output "vnet_id" {
  value = azurerm_virtual_network.aks-vnet.id
}

output "control_plane_subnet_id" {
  value = azurerm_subnet.control-plane-subnet.id
}

output "worker_node_subnet_id" {
  value = azurerm_subnet.worker-node-subnet.id
}

output "networking_resource_group_name" {
  value = azurerm_resource_group.networking-resource-group.name
}

output "aks_nsg_id" {
  value = azurerm_network_security_group.aks-nsg.id
}
