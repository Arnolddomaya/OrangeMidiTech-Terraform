# Stage 1 : Resource Group

> Create resource groups at the subscription level

Typically, you deploy Azure resources to a resource group in your Azure subscription. However, you can also create Azure resource groups, and create Azure resources at the subscription level. [Terraform Resource Group](https://www.terraform.io/docs/providers/azurerm/d/resource_group.html)

## Authenticating using the Azure CLI 

Terraform supports a number of different methods for authenticating to Azure [Logging into the Azure CLI](https://www.terraform.io/docs/providers/azurerm/auth/azure_cli.html)

Firstly, login to the Azure CLI using:
```sh
az login
```

Once logged in - it's possible to list the Subscriptions associated with the account via:
```sh
az account list
```

Should you have more than one Subscription, you can specify the Subscription to use via the following command:
```sh
az account set --subscription="SUBSCRIPTION_ID"
```

You can now initialize you terraform :
```sh
terraform init
```

At this point running either `terraform plan` or `terraform apply` should allow Terraform to run using the Azure CLI to authenticate.

---

Terraform supports a number of different methods for authenticating to Azure:

- [Authenticating to Azure using the Azure CLI](https://www.terraform.io/docs/providers/azurerm/auth/azure_cli.html)
- [Authenticating to Azure using Managed Service Identity](https://www.terraform.io/docs/providers/azurerm/auth/managed_service_identity.html)
- [Authenticating to Azure using a Service Principal and a Client Certificate](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_certificate.html)
- [Authenticating to Azure using a Service Principal and a Client Secret](https://www.terraform.io/docs/providers/azurerm/auth/service_principal_client_secret.html)
