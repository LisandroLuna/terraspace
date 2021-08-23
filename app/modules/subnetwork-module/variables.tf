variable "sn_name" {
  description = "subnetwork name (required)"
  type        = string
}
variable "sn_cidr" {
  description = "subnetwork ip_cidr_range (required)"
  type        = string
}
variable "sn_region" {
  description = "subnetwork region (required)"
  type        = string
}
variable "sn_network" {
  description = "subnetwork network (required)"
  type        = string
}