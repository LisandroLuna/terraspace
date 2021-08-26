# Network
network_1     = "ilb_network"
region_1      = "europe-west1"
sn_name_1     = "l7-ilb-subnet"
sn_cidr_1     = "10.0.1.0/24"
sn_name_2     = "l7-ilb-proxy-subnet"
sn_cidr_2     = "10.0.0.0/24"
sn_purpose_2  = "INTERNAL_HTTPS_LOAD_BALANCER"
sn_role_2     = "ACTIVE"

# TI 1
ti_name_1     = "vm-1"
ti_type_1     = "n1-standard-1"
ti_tags_1     = ["http-server"]
ti_image_1    = "debian-cloud/debian-10"
ti_script_1   = <<-EOF1
                  #! /bin/bash\ 
                  set -euo pipefail

                  export DEBIAN_FRONTEND=noninteractive
                  apt-get update
                  apt-get install -y nginx-light jq

                  NAME=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/hostname")
                  IP=$(curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip")
                  METADATA=$(curl -f -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/attributes/?recursive=True" | jq 'del(.["startup-script"])')

                  cat <<EOF > /var/www/html/index.html
                  <pre>
                  Name: $NAME
                  IP: $IP
                  Metadata: $METADATA
                  </pre>
                  EOF
                EOF1




