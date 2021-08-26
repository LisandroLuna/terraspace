# allow all access from IAP and health check ranges
resource "google_compute_firewall" "fw-iap" {
  name          = var.fw_name // "l7-ilb-fw-allow-iap-hc"
  direction     = var.fw_direction // "INGRESS"
  network       = var.fw_network // google_compute_network.ilb_network.id
  source_ranges = var.fw_source_ranges // ["130.211.0.0/22", "35.191.0.0/16", "35.235.240.0/20"]
  allow {
    protocol = var.fw_allow_protocol // "tcp"
  }
}
