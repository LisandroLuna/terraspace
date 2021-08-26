resource "google_compute_network" "vpc_network" {
  name = var.nw_name
  auto_create_subnetworks = false
}