#--------------------------------------------------------------
# Provider
#--------------------------------------------------------------
provider "azurerm" {}

#--------------------------------------------------------------
# RG
#--------------------------------------------------------------
resource "azurerm_resource_group" "k8s" {
    name     = "${var.project_company}-${var.project_department}-${var.project_name}-${var.project_environment}"
    location = "${var.project_location}"
    tags = {
        compagny            = "${var.project_company}"
        department          = "${var.project_company}"
        project             = "${var.project_company}"
        environment         = "${var.project_environment}"
    }
}

#--------------------------------------------------------------
# AKS
#--------------------------------------------------------------
resource "azurerm_kubernetes_cluster" "k8s" {
    name                    = "${var.project_company}-${var.project_environment}-${var.project_location}-${var.project_name}-aks"
    location                = "${azurerm_resource_group.k8s.location}"
    resource_group_name     = "${azurerm_resource_group.k8s.name}"
    dns_prefix              = "${var.project_environment}${var.project_name}"

    agent_pool_profile {
        name                = "agentpool"
        count               = "1"
        vm_size             = "Standard_DS1_v2"
        os_type             = "Linux"
        os_disk_size_gb     = 30
    }

    service_principal {
        client_id           = "${var.service_principal_client_id}"
        client_secret       = "${var.service_principal_client_secret}"
    }

    tags = {
        compagny            = "${var.project_company}"
        department          = "${var.project_company}"
        project             = "${var.project_company}"
        environment         = "${var.project_environment}"
    }
}