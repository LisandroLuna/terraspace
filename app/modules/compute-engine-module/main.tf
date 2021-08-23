resource "google_compute_instance" "vitual_machine" {
  name         = var.vm_name
  machine_type = var.vm_type 
  zone         = var.vm_zone 

  boot_disk {
    initialize_params {
      image = var.vm_image 
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  metadata_startup_script = var.vm_script 

  network_interface {
    network = var.vm_network
    subnetwork = var.vm_sub_network

    access_config {
      // Ephemeral IP
    }
  }
}