module "ilb_network" {
  source = "../../modules/compute-vpc-module"
  nw_name                        = var.network_1
}

module "proxy_subnet" {
  source = "../../modules/compute-subnetwork-module"
  sn_name                        = var.sn_name_2
  sn_cidr                        = var.sn_cidr_2
  sn_region                      = var.region_1
  sn_network                     = module.ilb_network.id
  sn_purpose                     = var.sn_purpose_2
  sn_role                        = var.sn_role_2
}

module "ilb_subnet" {
  source = "../../modules/compute-subnetwork-module"
  sn_name                        = var.sn_name_1
  sn_cidr                        = var.sn_cidr_1
  sn_region                      = var.region_1
  sn_network                     = module.ilb_network.id
}

module "forwarding_rule" {
  source = "../../modules/compute-forwarding-rule"
  fr_name                        = var.fr_name 
  fr_region                      = var.region_1
  fr_depends                     = var.fr_depends
  fr_protocol                    = var.fr_protocol 
  fr_scheme                      = var.fr_scheme 
  fr_port_range                  = var.fr_port_range
  fr_target                      = var.fr_target 
  fr_network                     = module.ilb_network.id
  fr_subnetwork                  = module.ilb_subnet.id
  fr_tier                        = var.fr_tier
}

module "target_http_proxy" {
  source = "../../modules/compute-region-target-http-proxy"
  hp_name                       = var.hp_name
  hp_region                     = var.region_1
  hp_url_map                    = module.region_url_map.default.id
}

module "region_url_map" {
  source = "../../modules/compute-region-url-map"
  rum_name                      = var.rum_name
  rum_region                    = var.region_1
  rum_service                   = var.rum_service
}

module "region_backend_service" {
  source = "../../modules/compute-region-backend-service"
  bs_name                       = var.bs_name
  bs_region                     = var.region_1
  bs_protocol                   = var.bs_protocol
  bs_scheme                     = var.bs_scheme
  bs_timeout                    = var.bs_timeout
  bs_health_check               = var.bs_health_check
  bs_backend_group              = var.bs_backend_group
  bs_backend_mode               = var.bs_backend_mode
  bs_backend_scaler             = var.bs_backend_scaler
}

module "instance_template" {
  source = "../../modules/compute-instance-template"
  it_name                       = var.it_name
  it_type                       = var.it_type
  it_tags                       = var.it_tags
  it_network                    = module.ilb_network.id
  it_subnetwork                 = module.ilb_subnet.id
  it_disk_image                 = var.it_disk_image
  it_disk_auto_delete           = var.it_disk_auto_delete
  it_disk_boot                  = var.it_disk_boot
  it_meta_script                = var.it_meta_script
  it_life_creatre_before_dest   = var.it_life_creatre_before_dest
}

module "region_health_check" {
  source = "../../modules/compute-region-health-check"
  rhc_name                      = var.rhc_name
  rhc_region                    = var.region_1
  rhc_port_speci                = var.rhc_port_speci
}

module "region_instance_group_manager" {
  source = "../../modules/compute-region-health-check"
  rig_name                      = var.rhc_name
  rig_region                    = var.region_1
  rig_version_i_template        = var.rig_version_i_template
  rig_version_name              = var.rig_version_name
  rig_base_i_name               = var.rig_base_i_name
  rig_target_size               = var.rig_target_size

}

module "compute_firewall" {
  source = "../../modules/compute-firewall"  
  fw_name                       = var.fw_name
  fw_direction                  = var.fw_direction
  fw_network                    = module.ilb_subnet.id
  fw_source_ranges              = var.fw_source_ranges
  fw_allow_protocol             = var.fw_allow_protocol
}

module "vm-test" {
  source = "../../modules/compute-engine-module"
  vm_name                       = var.vm_name
  vm_zone                       = var.zone_1
  vm_type                       = var.vm_type
  vm_network                    = module.ilb_network.id
  vm_sub_network                = module.ilb_subnet.id
  vm_image                      = var.vm_image
}
