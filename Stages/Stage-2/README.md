# Stage 2 : Variables

Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering the module's own source code, and allowing modules to be shared between different configurations. [Input Variables](https://www.terraform.io/docs/configuration/variables.html)

## Variable Definition Precedence 

The above mechanisms for setting variables can be used together in any combination. If the same variable is assigned multiple values, Terraform uses the last value it finds, overriding any previous values.

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

- Environment variables
- The `terraform.tfvars` file, if present.
- The `terraform.tfvars.json` file, if present.
- Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
- Any `-var` and `-var-file` options on the command line, in the order they are provided. (This includes variables set by a Terraform Enterprise workspace.)

## Example

### Environment Variables 

```sh
export TF_VAR_project=orangemiditech
terraform plan
```

### Variable Definitions (.tfvars) Files 

```sh
terraform apply -var-file="testing.tfvars"
```

Terraform also automatically loads a number of variable definitions files if they are present:

- Files named exactly `terraform.tfvars` or `terraform.tfvars.json`.
- Any files with names ending in `.auto.tfvars` or `.auto.tfvars.json`.

### Variables on the Command Line 

To specify individual modules on the command line, use the -var option when running the terraform plan and terraform apply commands:

```sh
terraform apply -var="project=orangemiditech"
```