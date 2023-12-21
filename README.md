# Terraform OCI Core Cross Connect Group
The code provides a reusable and standalone Terraform module that provisions a Cross Connect Group on Oracle Cloud Infrastructure.


## Example Input
`cross_connect_group.auto.tfvars.json`:
```json
{
  "cross_connect_group": {
    "compartment_id": "ocid1.compartment.oc1",
    "display_name": "my-cross-connect-group-1",
    "customer_reference_name": "my-cross-connect-group-1",
    "macsec_properties": [{
        "state": "ENABLED",
        "encryption_cipher": "aes128-gcm-xpn",
        "is_unprotected_traffic_allowed": false,
        "primary_key": [{
          "connectivity_association_key_secret_id": "ocid1.connectivity_association_key_secret_id",
          "connectivity_association_name_secret_id": "ocid1.connectivity_association_name_secret_id"
        }]
      }]    
  }
}
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.8 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 5.18.0 |
| <a name="requirement_provider_1"></a> [provider\_1](#requirement\_provider\_1) | ~> 1.0 |
| <a name="requirement_provider_2"></a> [provider\_2](#requirement\_provider\_2) | ~> 2.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | ~> 5.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_cross_connect_group.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_cross_connect_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cross_connect_group"></a> [cross\_connect\_group](#input\_cross\_connect\_group) | Cross Connect Group Input Object | <pre>object({<br>    compartment_id        = string,<br>    display_name          = string,<br><br>    # Optional<br>    customer_reference_name                     = optional(string),<br>    defined_tags                                = optional(map(string)),<br>    freeform_tags                               = optional(map(string)),<br>    macsec_properties = optional(list(object({<br>      # Required<br>      state = string,<br><br>      # Optional<br>      encryption_cipher              = optional(string),<br>      is_unprotected_traffic_allowed = optional(bool),<br>      primary_key = optional(list(object({<br>        # Required<br>        connectivity_association_key_secret_id  = string,<br>        connectivity_association_name_secret_id = string,<br>      })))<br>    })))<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->