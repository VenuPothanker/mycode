/* Alta3 Research - rzfeeser@alta3.com
   Working with "for_each" within a null_resource */

/* Terraform block */
terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

/* provider block */
provider "null" {
  # Configuration options
}

/* a list of local variables */
locals {  rgs = {
          "alpha" = { "region" ="eastus"
                      "vnet" ="omega" }
          "bravo" = { "region" ="southindia"
                      "vnet" ="psi" }
          "charlie" = {"region" = "westus2"
                       "vnet" ="chi" }
       }}

resource "null_resource" "dummy_rgs" {
  for_each = tomap(local.rgs)
  triggers = {
            
               name= each.key
               region= each.value.region
            
        }
    }

resource "null_resource" "dummy_vnets" {
    for_each = tomap(local.rgs)
    triggers = {
            name   = each.value.vnet
            region = each.value.region
            rg = each.key
        }
}
/* We want these outputs */
output "op_rgs" {
  value = null_resource.dummy_rgs
}

output "op_vnets" {
    value = null_resource.dummy_vnets
}
