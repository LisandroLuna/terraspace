# backend service
resource "google_compute_region_backend_service" "default" {
  name                  = var.bs_name // "l7-ilb-backend-subnet"
  region                = var.bs_region // "europe-west1"
  protocol              = var.bs_protocol // "HTTP"
  load_balancing_scheme = var.bs_scheme // "INTERNAL_MANAGED"
  timeout_sec           = var.bs_timeout // 10
  health_checks         = var.bs_health_check // [google_compute_region_health_check.default.id]
  backend {
    group           = var.bs_backend_group // google_compute_region_instance_group_manager.mig.instance_group
    balancing_mode  = var.bs_backend_mode // "UTILIZATION"
    capacity_scaler = var.bs_backend_scaler // 1.0
  }
}
