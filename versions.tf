terraform {
  experiments = [module_variable_optional_attrs]
  required_version = "~> 1.2.8"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.18.0"
    }
    provider_1 = {
      source  = "module_1"
      version = "~> 1.0"
    }
    provider_2 = {
      source  = "module_2"
      version = "~> 2.5"
    }
  }
}
