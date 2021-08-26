# instance template
resource "google_compute_instance_template" "instance_template" {
  name         = var.it_name // "l7-ilb-mig-template"
  machine_type = var.it_type // "e2-small"
  tags         = var.it_tags // ["http-server"]

  network_interface {
    network    = var.it_network // google_compute_network.ilb_network.id
    subnetwork = var.it_subnetwork // google_compute_subnetwork.ilb_subnet.id
    access_config {
      # add external ip to fetch packages
    }
  }
  disk {
    source_image = var.it_disk_image // "debian-cloud/debian-10"
    auto_delete  = var.it_disk_auto_delete // true
    boot         = var.it_disk_boot // true
  }

  # install nginx and serve a simple web page
  metadata = {
    startup-script = var.it_meta_script // <<-EOF1
  }
  lifecycle {
    create_before_destroy = var.it_life_creatre_before_dest //  true
  }
}
