#--------------------------------------------------------------
# Service Principal
#--------------------------------------------------------------
variable "service_principal_client_id" {
  description               = "The Client ID for the Service Principal."
}
variable "service_principal_client_secret" {
  description               = "The Client Secret for the Service Principal."
}

#--------------------------------------------------------------
# Project
#--------------------------------------------------------------
variable "project_name" {
    description             = "Name for this project"
}
variable "project_company" {
  description               = "Company would usually be the same for each subscription."
}
variable "project_department" {
  description               = "Department is a name within the organization that contains a group of individuals."
}
variable "project_environment" {
    description             = "Environment is the name that describes the deployment lifecycle of the applications or services, such as Dev, QA, or Prod."
}

variable "project_location" {
  description               = "Azure Location (run 'az account list-locations --output table' or consult https://azure.microsoft.com/en-us/global-infrastructure/locations/)"
}
