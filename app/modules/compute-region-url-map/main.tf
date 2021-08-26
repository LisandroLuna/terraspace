# url map
resource "google_compute_region_url_map" "default" {
  name            = var.rum_name // "l7-ilb-regional-url-map"
  region          = var.rum_region // "europe-west1"
  default_service = var.rum_service //google_compute_region_backend_service.default.id
}