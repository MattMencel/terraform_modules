output "spn_object_id" {
  value = "${azuread_service_principal.spn.id}"
}

output "spn_application_id" {
  value = "${azuread_application.spn.application_id}"
}
