variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}
variable "location" {
  type = string
  default = "swedencentral"
  description = <<DESCRIPTION
  geolocation of the azure resources
  DESCRIPTION
}
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "ai-lz-rg-01"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "ai-lz-vnet-01"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = string
  default     = "192.168.0.0/23"
}

variable "ai_foundry_purge_on_destroy" {
  description = "Purge AI Foundry on destroy"
  type        = bool
  default     = true
}

variable "ai_foundry_create_agent_service" {
  description = "Create AI Agent Service"
  type        = bool
  default     = true
}

variable "ai_model_name" {
  description = "Name of the AI model deployment"
  type        = string
  default     = "gpt-4.1"
}

variable "ai_model_format" {
  description = "Format of the AI model"
  type        = string
  default     = "OpenAI"
}

variable "ai_model_version" {
  description = "Version of the AI model"
  type        = string
  default     = "2025-04-14"
}

variable "ai_model_scale_type" {
  description = "Scale type for the AI model"
  type        = string
  default     = "GlobalStandard"
}

variable "ai_model_scale_capacity" {
  description = "Scale capacity for the AI model"
  type        = number
  default     = 1
}

variable "ai_project_name" {
  description = "Name of the AI project"
  type        = string
  default     = "project-1"
}

variable "ai_project_description" {
  description = "Description of the AI project"
  type        = string
  default     = "Project 1 description"
}

variable "ai_project_display_name" {
  description = "Display name of the AI project"
  type        = string
  default     = "Project 1 Display Name"
}

variable "ai_project_create_connections" {
  description = "Whether to create project connections for AI project"
  type        = bool
  default     = true
}

# Application Gateway Configuration Variables
variable "app_gateway_deploy" {
  description = "Whether to deploy the Application Gateway"
  type        = bool
  default     = false
}

variable "app_gateway_backend_pool_name" {
  description = "Name of the Application Gateway backend address pool"
  type        = string
  default     = "example-backend-pool"
}

variable "app_gateway_http_settings_name" {
  description = "Name of the Application Gateway backend HTTP settings"
  type        = string
  default     = "example-http-settings"
}

variable "app_gateway_http_settings_port" {
  description = "Port for the Application Gateway backend HTTP settings"
  type        = number
  default     = 80
}

variable "app_gateway_http_settings_protocol" {
  description = "Protocol for the Application Gateway backend HTTP settings"
  type        = string
  default     = "Http"
}

variable "app_gateway_frontend_port_name" {
  description = "Name of the Application Gateway frontend port"
  type        = string
  default     = "example-frontend-port"
}

variable "app_gateway_frontend_port" {
  description = "Port number for the Application Gateway frontend"
  type        = number
  default     = 80
}

variable "app_gateway_listener_name" {
  description = "Name of the Application Gateway HTTP listener"
  type        = string
  default     = "example-listener"
}

variable "app_gateway_rule_name" {
  description = "Name of the Application Gateway request routing rule"
  type        = string
  default     = "example-rule"
}

variable "app_gateway_rule_type" {
  description = "Type of the Application Gateway request routing rule"
  type        = string
  default     = "Basic"
}

variable "app_gateway_rule_priority" {
  description = "Priority of the Application Gateway request routing rule"
  type        = number
  default     = 100
}