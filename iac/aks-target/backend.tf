terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.63.0"
    }
  }
  backend "remote" {
    organization = "mizael"

    workspaces {
      name = "k8s-stack-example-aks-target"
    }
  }
}