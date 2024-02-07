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
  ### state
  validation {
    condition     = var.cross_connect_group.macsec_properties != null ? (var.cross_connect_group.macsec_properties[0].state != null ? (contains(["ENABLED", "DISABLED"], var.cross_connect_group.macsec_properties[0].state)) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.state' must be one of 'ENABLED', 'DISABLED'."
  }
  ### encryption_cipher
  validation {
    condition     = var.cross_connect_group.macsec_properties != null ? (var.cross_connect_group.macsec_properties[0].encryption_cipher != null ? contains(["AES128_GCM_XPN", "AES256_GCM_XPN"], var.cross_connect_group.macsec_properties[0].encryption_cipher) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.encryption_cipher' must be one of 'AES128_GCM_XPN', 'AES256_GCM_XPN'."
  }
  ## is_unprotected_traffic_allowed
  validation {
    condition     = var.cross_connect_group.macsec_properties != null ? (var.cross_connect_group.macsec_properties[0].is_unprotected_traffic_allowed != null ? (contains([true, false], var.cross_connect_group.macsec_properties[0].is_unprotected_traffic_allowed)) : true) : true
    error_message = "Validation of the Cross Connect object failed. 'macsec_properties.is_unprotected_traffic_allowed' must be one of 'true', 'false'."
  }
}