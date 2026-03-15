module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.3.0"
}

# Get the deployer IP address to allow for public write to the key vault. This is to make sure the tests run.
# In practice your deployer machine will be on a private network and this will not be required.
data "http" "ip" {
  url = "https://api.ipify.org/"
  retry {
    attempts     = 5
    max_delay_ms = 1000
    min_delay_ms = 500
  }
}

module "test" {
  //source = "./.terraform/modules/test"  # Reference to local module in .terraform folder
  source  = "Azure/avm-ptn-aiml-landing-zone/azurerm"
  version = "0.1.1"

  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_definition = {
    name          = var.vnet_name
    address_space = var.vnet_address_space
  }
  ai_foundry_definition = {
    purge_on_destroy = var.ai_foundry_purge_on_destroy
    ai_foundry = {
      create_ai_agent_service = var.ai_foundry_create_agent_service
    }
    ai_model_deployments = {
      "gpt-4o" = {
        name = var.ai_model_name
        model = {
          format  = var.ai_model_format
          name    = var.ai_model_name
          version = var.ai_model_version
        }
        scale = {
          type     = var.ai_model_scale_type
          capacity = var.ai_model_scale_capacity
        }
      }
    }
    ai_projects = {
      project_1 = {
        name                       = var.ai_project_name
        description                = var.ai_project_description
        display_name               = var.ai_project_display_name
        create_project_connections = var.ai_project_create_connections
        cosmos_db_connection = {
          new_resource_map_key = "this"
        }
        ai_search_connection = {
          new_resource_map_key = "this"
        }
        storage_account_connection = {
          new_resource_map_key = "this"
        }
      }
    }
    ai_search_definition = {
      this = {
        enable_diagnostic_settings = false
      }
    }
    cosmosdb_definition = {
      this = {
        enable_diagnostic_settings = false
        consistency_level          = "Session"
      }
    }
    key_vault_definition = {
      this = {
        enable_diagnostic_settings = false
      }
    }

    storage_account_definition = {
      this = {
        enable_diagnostic_settings = false
        shared_access_key_enabled  = true #configured for testing
        endpoints = {
          blob = {
            type = "blob"
          }
        }
      }
    }
  }
  app_gateway_definition = {
    deploy = var.app_gateway_deploy
    
    backend_address_pools = {
      example_pool = {
        name = var.app_gateway_backend_pool_name
      }
    }

    backend_http_settings = {
      example_http_settings = {
        name     = var.app_gateway_http_settings_name
        port     = var.app_gateway_http_settings_port
        protocol = var.app_gateway_http_settings_protocol
      }
    }

    frontend_ports = {
      example_frontend_port = {
        name = var.app_gateway_frontend_port_name
        port = var.app_gateway_frontend_port
      }
    }

    http_listeners = {
      example_listener = {
        name               = var.app_gateway_listener_name
        frontend_port_name = var.app_gateway_frontend_port_name
      }
    }

    request_routing_rules = {
      example_rule = {
        name                       = var.app_gateway_rule_name
        rule_type                  = var.app_gateway_rule_type
        http_listener_name         = var.app_gateway_listener_name
        backend_address_pool_name  = var.app_gateway_backend_pool_name
        backend_http_settings_name = var.app_gateway_http_settings_name
        priority                   = var.app_gateway_rule_priority
      }
    }
  }
  bastion_definition = {
  }
  container_app_environment_definition = {
    enable_diagnostic_settings = false
  }
  enable_telemetry           = var.enable_telemetry
  flag_platform_landing_zone = true
  genai_container_registry_definition = {
    enable_diagnostic_settings = false
  }
  genai_cosmosdb_definition = {
    enable_diagnostic_settings = false
  }
  genai_key_vault_definition = {
    #this is for AVM testing purposes only. Doing this as we don't have an easy for the test runner to be privately connected for testing.
    public_network_access_enabled = true
    network_acls = {
      bypass   = "AzureServices"
      ip_rules = ["${data.http.ip.response_body}/32"]
    }
  }
  genai_storage_account_definition = {
    enable_diagnostic_settings = false
  }
  ks_ai_search_definition = {
    enable_diagnostic_settings = false
  }
}