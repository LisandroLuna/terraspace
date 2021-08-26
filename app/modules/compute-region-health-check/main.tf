# health check
resource "google_compute_region_health_check" "default" {
  name     = var.rhc_name // "l7-ilb-hc"
  region   = var.rhc_region // "europe-west1"
  http_health_check {
    port_specification = var.rhc_port_speci // "USE_SERVING_PORT"
  }
}