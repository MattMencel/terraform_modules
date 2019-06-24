resource "random_uuid" "spn_password" {}

resource "azuread_application" "spn" {
  name     = "${var.spn_name}"
  homepage = "${local.spn_url}"
}

resource "azuread_service_principal" "spn" {
  application_id = "${azuread_application.spn.application_id}"
}

resource "azuread_service_principal_password" "spn" {
  service_principal_id = "${azuread_service_principal.spn.id}"
  value                = "${random_uuid.spn_password.result}"
  end_date_relative    = "${var.spn_password_expiry}"
}

resource "azurerm_key_vault_secret" "spn_id" {
  name         = "${azuread_application.spn.name}-ID"
  value        = "${azuread_service_principal.spn.application_id}"
  count        = "${length(var.spn_key_vault_ids)}"
  key_vault_id = "${element(var.spn_key_vault_ids, count.index)}"
}

resource "azurerm_key_vault_secret" "spn_secret" {
  name         = "${azuread_application.spn.name}-SECRET"
  value        = "${random_uuid.spn_password.result}"
  count        = "${length(var.spn_key_vault_ids)}"
  key_vault_id = "${element(var.spn_key_vault_ids, count.index)}"
}
