resource "oci_core_cross_connect_group" "this" {
  # Required
  compartment_id = var.cross_connect_group.compartment_id
  display_name   = var.cross_connect_group.display_name
  # Optional
  customer_reference_name = var.cross_connect_group.customer_reference_name
  defined_tags            = var.cross_connect_group.defined_tags
  freeform_tags           = var.cross_connect_group.freeform_tags
  dynamic "macsec_properties" {
    for_each = (var.cross_connect_group.macsec_properties != null) ? var.cross_connect_group.macsec_properties : []
    content {
      state                          = macsec_properties.value.state
      encryption_cipher              = try(macsec_properties.value.encryption_cipher, null)
      is_unprotected_traffic_allowed = try(macsec_properties.value.is_unprotected_traffic_allowed, null)

      dynamic "primary_key" {
        for_each = (macsec_properties.value.primary_key != null) ? macsec_properties.value.primary_key : []
        content {
          connectivity_association_key_secret_id  = primary_key.value.connectivity_association_key_secret_id
          connectivity_association_name_secret_id = primary_key.value.connectivity_association_name_secret_id
        }
      }
    }
  }
}