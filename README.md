# Orange Midi Tech - Terraform

Example of terraform AKS script with State storage in Blob

> *Orange Midi Tech* : https://docs.google.com/presentation/d/1ljkqz3BhoKvFSttSRQiLTa9iKUTZgGmDKF8Tmf1Yqg8/edit?usp=sharing

## Stages 

- [Stage 1](./Stages/Stage-1) : Resource Group
- [Stage 2](./Stages/Stage-2) : Variables

# AKS with Terraform State in BlobStorage

## Azure Login

```sh
az login
az account list
az account set -s ${id}
az account show
```

## Create Ressource Group and Storage Account dedicated for terraform

Example:
- **RESOURCE_GROUP_NAME** : Company-Department-Location-terraform-rg
- **STORAGE_ACCOUNT_NAME** : CompanyDepartmentLocationterraformsta

**Company** would usually be the same for each subscription. However, some companies may have child companies within the organizational structure. These companies may be managed by a central IT group. 
**Department** is a name within the organization that contains a group of individuals.

```sh
# Create resource group
az group create --name ${RESOURCE_GROUP_NAME} --location ${RESOURCE_GROUP_LOCATION}

# Create storage account
az storage account create --resource-group ${RESOURCE_GROUP_NAME} --name ${STORAGE_ACCOUNT_NAME} --sku Standard_LRS --encryption-services blob
```

## Configure Terraform environment variables

To enable Terraform to provision resources into Azure, create an Azure AD service principal. The service principal grants your Terraform scripts to provision resources in your Azure subscription.

```sh
# Create service principal into subscription
az ad sp create-for-rbac -n "CompanyTerraformName" --role="Contributor" --scopes="/subscriptions/${SUBSCRIPTION_ID}"
```

## Configure Provider

- **ARM_SUBSCRIPTION_ID**         : The Subscription ID in which the Storage Account exists.
- **ARM_ACCESS_KEY**              : Azure storage account connection string
- **ARM_CLIENT_ID**               : The Client ID of the Service Principal.
- **ARM_CLIENT_SECRET**           : The Client Secret of the Service Principal. 
- **ARM_TENANT_ID**               : The Tenant ID in which the Subscription exists. 

```sh
export | grep ARM
declare -x ARM_CLIENT_ID=""
declare -x ARM_CLIENT_SECRET=""
declare -x ARM_SUBSCRIPTION_ID=""
declare -x ARM_TENANT_ID=""
declare -x ARM_ACCESS_KEY=""
```

You can also use [Backend configuration](https://www.terraform.io/docs/backends/types/azurerm.html) directly in `main.tf` [Terraform Azure Provider](https://www.terraform.io/docs/providers/azurerm/index.html)

## Configure Variables

Update `default.auto.tfvars` example file.

## Run

```sh
terraform init -backend-config="container_name=${CONTAINER}" -backend-config="key=${FILE_NAME}.tfstate" 
```

```sh
terraform plan 
```

```sh
terraform apply 
```

## Naming conventions for Azure resources
- [MS Azure Naming conventions](https://docs.microsoft.com/fr-fr/azure/architecture/best-practices/naming-conventions)
- [MS Techcommunity Best practices for naming your Microsoft Azure resources](https://techcommunity.microsoft.com/t5/ITOps-Talk-Blog)

## Documentation 
- [Microsoft Terraform Backend](https://docs.microsoft.com/bs-latn-ba/azure/terraform/terraform-backend)
