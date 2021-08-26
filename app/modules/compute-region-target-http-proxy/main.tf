# http proxy
resource "google_compute_region_target_http_proxy" "default" {
  name     = var.hp_name //"l7-ilb-target-http-proxy"
  region   = var.hp_region // "europe-west1"
  url_map  = var.hp_url_map // google_compute_region_url_map.default.id
}