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