# outputs.tf

output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "Name of the provisioned AKS cluster"
}

output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "ID of the provisioned AKS cluster"
}

output "aks_kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].raw_config
  description = "Kubeconfig file for the provisioned AKS cluster"
}
