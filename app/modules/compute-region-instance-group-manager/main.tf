# MIG
resource "google_compute_region_instance_group_manager" "mig" {
  name     = var.rig_name // "l7-ilb-mig1"
  region   = var.rig_region // "europe-west1"
  version {
    instance_template = var.rig_version_i_template // google_compute_instance_template.instance_template.id
    name              = var.rig_version_name // "primary"
  }
  base_instance_name = var.rig_base_i_name // "vm"
  target_size        = var.rig_target_size // 2
}