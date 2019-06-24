# Terraform/SPN

Module for generating Azure Service Principals.
___

## Usage

ADD USAGE DOCUMENTATION

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
