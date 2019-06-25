# Terraform/SPN

Module for generating Azure Service Principals.

___

## Prerequisites

A master SPN is needed in order to use this module. In addition to the normal "Contributor" role usually assigned to an SPN for Terraform, the master SPN that will be used for this module requires these additional roles/permissions.

* **Application Administrator** role in Azure Active Directory. This allows the master SPN to create and manage application and SPN objects in Azure AD.
* **User Access Administrator** role on the subscription/s. This allows the master SPN to manage access permissions on subscriptions and resource groups in Azure so it can grant managed SPNs access to the correct resources.

___

## Usage

The module creates an application and SPN object, an SPN password with an expiration, and places the SPN ID and SECRET in KeyVault secrets.

The module accepts a list of KeyVaults. The intention being you may want to store the secrets in a central KeyVault and then additionally store them in a KeyVault for a downstream application team.

To use, call this module with the following inputs...

* `spn_name`: The name for this SPN.
* `spn_url`: The URL for the SPN.  Defaults to the SPN name.
* `spn_password_expiry`: When to expire the SPN password in hours, relative to creation time. Defaults to one year (8760 hours)
* `spn_key_vault_ids`: A list of keyvault IDs where the new SPN ID and SECRET will be stored.

___

## Inputs and Outputs

_Generated with [terraform-docs](https://github.com/segmentio/terraform-docs) and [pre-commit](https://www.unixdaemon.net/tools/terraform-precommit-hooks/)_

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                  | Description                                                                                                                          |  Type  |  Default  | Required |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | :----: | :-------: | :------: |
| spn\_key\_vault\_ids  | A list of KeyVault IDs where the SPN ID and SECRET are stored.                                                                       |  list  |    n/a    |   yes    |
| spn\_name             | Name of the SPN to create.                                                                                                           | string |    n/a    |   yes    |
| spn\_password\_expiry | Expiration time for the SPN password, relative to SPN creation.  If no value is passed, it defaults to 1 year from creation (8760h). | string | `"8760h"` |    no    |
| spn\_url              | URL for the SPN.  Defaults to https:\/\/$${var.spn_name}                                                                             | string |   `""`    |    no    |

## Outputs

| Name                 | Description |
| -------------------- | ----------- |
| spn\_application\_id |             |
| spn\_object\_id      |             |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
