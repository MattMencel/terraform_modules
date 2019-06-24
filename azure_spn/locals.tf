locals {
  spn_url = "${var.spn_url == "" ? "https://${var.spn_name}" : var.spn_url}"
}
