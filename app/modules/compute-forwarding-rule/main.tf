# This is where you put your resource declaration
# forwarding rule
resource "google_compute_forwarding_rule" "google_compute_forwarding_rule" {
  name                  = var.fr_name //"l7-ilb-forwarding-rule"
  region                = var.fr_region // "europe-west1"
  depends_on            = var.fr_depends // [google_compute_subnetwork.proxy_subnet]
  ip_protocol           = var.fr_protocol // "TCP"
  load_balancing_scheme = var.fr_scheme // "INTERNAL_MANAGED"
  port_range            = var.fr_port_range // "80"
  target                = var.fr_target // google_compute_region_target_http_proxy.default.id
  network               = var.fr_network // google_compute_network.ilb_network.id
  subnetwork            = var.fr_subnetwork // google_compute_subnetwork.ilb_subnet.id
  network_tier          = var.fr_tier // "PREMIUM"
}