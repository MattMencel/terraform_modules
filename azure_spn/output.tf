output "spn_object_id" {
  description = "SPN Object ID"
  value       = "${azuread_service_principal.spn.id}"
}

output "spn_application_id" {
  description = "SPN Application ID. Sometimes referred to the Client ID. Used for authenticating with the SPN."
  value       = "${azuread_application.spn.application_id}"
}
