module "vpc_network_1"{
  source = "../../modules/vpc-module"
  nw_name                        = var.network_1
}

module "sub_network_1"{
  source = "../../modules/subnetwork-module"
  sn_name                        = var.sn_name_1
  sn_cidr                        = var.sn_cidr_1
  sn_region                      = var.sn_region_1
  sn_network                     = module.vpc_network_1.id
}

module "sub_network_2"{
  source = "../../modules/subnetwork-module"
  sn_name                        = var.sn_name_2
  sn_cidr                        = var.sn_cidr_2
  sn_region                      = var.sn_region_2
  sn_network                     = module.vpc_network_1.id
}
 
module "vm_1" {
  source = "../../modules/compute-engine-module"
  vm_name                        = var.vm_name_1
  vm_network                     = module.vpc_network_1.id
  vm_sub_network                 = module.sub_network_1.id
  vm_type                        = var.vm_type_1
  vm_zone                        = var.vm_zone_1
  vm_image                       = var.vm_image_1
  vm_script                      = var.vm_script_1
}
 
module "vm_2" {
  source = "../../modules/compute-engine-module"
  vm_name                        = var.vm_name_2
  vm_network                     = module.vpc_network_1.id
  vm_sub_network                 = module.sub_network_2.id
  vm_type                        = var.vm_type_2
  vm_zone                        = var.vm_zone_2
  vm_image                       = var.vm_image_2
  vm_script                      = var.vm_script_2
}