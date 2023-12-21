variable "cross_connect_group" {
  description = "Cross Connect Group Input Object"
  type = object({
    compartment_id        = string,
    display_name          = string,

    # Optional
    customer_reference_name                     = optional(string),
    defined_tags                                = optional(map(string)),
    freeform_tags                               = optional(map(string)),
    macsec_properties = optional(list(object({
      # Required
      state = string,

      # Optional
      encryption_cipher              = optional(string),
      is_unprotected_traffic_allowed = optional(bool),
      primary_key = optional(list(object({
        # Required
        connectivity_association_key_secret_id  = string,
        connectivity_association_name_secret_id = string,
      })))
    })))
  })
  # Validation
  ## macsec_properties
  ### macsec_properties (check that macsec_properties is not null; check if port_speed_shape_name is 1 Gbps; check that macsec_properties.state is not ENABLED)
  validation {
    condition     = var.cross_connect_group.macsec_properties != null ? (var.cross_connect_group.port_speed_shape_name == "1 Gbps" ? (var.cross_connect_group.macsec_properties[0].state != "ENABLED") : true) : true
    error_message = "Validation of the Cross Connect object failed. The Cross Connect selected port speed for single cross-connects or cross-connect groups must be 10 Gbps or greater to enable MACSec."
  }
  ### state
  validation {
    condition     = var.cross_connect_group.macsec_properties != null ? (var.cross_connect_group.macsec_properties[0].state != null ? (contains(["ENABLED", "DISABLED"], var.cross_connect_group.macsec_properties[0].state)) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.state' must be one of 'ENABLED', 'DISABLED'."
  }
  ### encryption_cipher
  validation {
    condition     = var.cross_connect_group.macsec_properties != null ? (var.cross_connect_group.macsec_properties[0].encryption_cipher != null ? contains(["aes128-gcm-xpn", "aes256-gcm-xpn"], var.cross_connect_group.macsec_properties[0].encryption_cipher) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.encryption_cipher' must be one of 'aes128-gcm-xpn', 'aes256-gcm-xpn'."
  }
  ## is_unprotected_traffic_allowed
  validation {
    condition     = var.cross_connect_group.macsec_properties != null ? (var.cross_connect_group.macsec_properties[0].is_unprotected_traffic_allowed != null ? (contains([true, false], var.cross_connect_group.macsec_properties[0].is_unprotected_traffic_allowed)) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.is_unprotected_traffic_allowed' must be one of 'true', 'false'."
  }
}