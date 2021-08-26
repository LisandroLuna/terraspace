variable "it_name" {
  type      = string
}
variable "it_type" {
  type      = string
}
variable "it_tags" {
  type      = list
  default   = []
}
variable "it_network" {
  type      = string
}
variable "it_subnetwork" {
  type      = string
}
variable "it_disk_image" {
  type      = string
}
variable "it_disk_auto_delete" {
  type      = bool
}

variable "it_disk_boot" {
  type      = bool
}
variable "it_meta_script" {
  type      = string
}
variable "it_life_creatre_before_dest" {
  type      = bool
}
