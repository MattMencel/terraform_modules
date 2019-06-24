variable "spn_name" {
  description = "Name of the SPN to create."
}

variable "spn_url" {
  description = "URL for the SPN.  Defaults to https:\\/\\/$${var.spn_name}"
  default     = ""
}

variable "spn_password_expiry" {
  description = "Expiration time for the SPN password, relative to SPN creation.  If no value is passed, it defaults to 1 year from creation (8760h)."
  default     = "8760h"
}

variable "spn_key_vault_ids" {
  type        = "list"
  description = "A list of KeyVault IDs where the SPN ID and SECRET are stored."
}
