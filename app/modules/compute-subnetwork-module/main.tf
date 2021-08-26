resource "google_compute_subnetwork" "sub_network" {
  name             = var.sn_name // "subnetwork"
  ip_cidr_range    = var.sn_cidr // "10.2.0.0/16"
  region           = var.sn_region // "us-central1"
  network          = var.sn_network // google_compute_network.custom-test.id
  purpose          = var.sn_purpose
  role             = var.sn_role 
}
