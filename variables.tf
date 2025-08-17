variable "mist_cloud" { # Mandatory
  type        = string
  description = "Target Juniper Mist Cloud API URL"
  validation {
    condition = contains([
      "api.mist.com",     # Global 01 (Americas)
      "api.gc1.mist.com", # Global 02 (Americas)
      "api.ac2.mist.com", # Global 03 (Americas)
      "api.gc2.mist.com", # Global 04 (Canada)
      "api.gc4.mist.com", # Global 05 (Americas)
      "api.eu.mist.com",  # EMEA 01 (Germany)
      "api.gc3.mist.com", # EMEA 02 (England)
      "api.ac6.mist.com", # EMEA 03 (United Arab Emirates)
      "api.gc6.mist.com", # EMEA 04 (Kingdom of Saudi Arabia)
      "api.ac5.mist.com", # APAC 01 (Australia)
      "api.gc7.mist.com", # APAC 03 (Japan)
    ], var.mist_cloud)    # Must be from the known list of Mist Cloud API URLs
    error_message = "Not a valid URL for Mist Cloud API URL"
  }
}

variable "org_id" { # Mandatory
  type        = string
  description = "Target Juniper Mist organization ID for all automation operations"
  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.org_id)) # Must have UUID length and structure
    error_message = "Not a valid string for Mist org's ID"
  }
}

variable "name-prefix" {
  type        = string
  description = "A name prefix for resource naming. Please note that some names inside nested variables will have explicit names only."
}

variable "site" { # Mandatory
  type = object({
    name         = string
    country_code = string
    timezone     = string
    address      = string
    notes        = string
    latlng       = map(number)
  })
  description = "Definition of the sites to be deployed"
}

variable "switch_root_password" { # Mandatory
  type        = string
  sensitive   = true
  description = "Switches' root password."
}

variable "switches" { # Mandatory
  type = map(object({
    name             = string
    role             = string
    mac              = string
    port_config      = any
    other_ip_configs = any
    vrf_instances    = any
  }))
  description = "Switches added to the site to form EVPN fabric"
}

variable "switch_template" { # Mandatory
  type = object({
    name            = string
    networks        = any
    port_usages     = any
    vrf_config      = any
    vrf_instances   = any
    switch_matching = any
  })
  description = "Org level network templates for switches"
}

variable "evpn_fabric" { # Mandatory
  type = object({
    name                   = string
    pod_name               = string
    bgp_local_as           = string
    as_base                = string
    subnet                 = string
    auto_router_id_subnet  = string
    auto_router_id_subnet6 = string
    auto_loopback_subnet  = string
    auto_loopback_subnet6 = string
  })
  description = "Site level EVPN fabric topology and fabric devices configiurations"
}
