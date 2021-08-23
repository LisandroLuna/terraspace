# Network
network_1     = "vpc-network"
sn_name_1     = "sub-network-1"
sn_cidr_1     = "10.1.0.0/16"
sn_region_1   = "us-central1"
sn_name_2     = "sub-network-1"
sn_cidr_2     = "10.2.0.0/16"
sn_region_2   = "us-west1"

# VM 1
vm_name_1     = "vm-1"
vm_type_1     = "n1-standard-1"
vm_zone_1     = "us-central1-a"
vm_image_1    = "debian-cloud/debian-10"
vm_script_1   = "sudo apt update; sudo apt install -y nginx"

# VM 2
vm_name_2     = "vm-2"
vm_type_2     = "n1-standard-1"
vm_zone_2     = "us-west1-a"
vm_image_2    = "debian-cloud/debian-10"
vm_script_2   = "sudo apt update; sudo apt install -y nginx"
