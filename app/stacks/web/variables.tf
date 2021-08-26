variable "network_1" {
  description = "network name (required)"
  type        = string
}
variable "region_1" {
  type        = string
}
variable "sn_name_1" {
  description = "(required)"
  type        = string
}
variable "sn_cidr_1" {
  description = "(required)"
  type        = string
}
variable "sn_purpose_1" {
  description = "(required)"
  type        = string
}
variable "sn_role_1" {
  description = "(required)"
  type        = string
}
variable "sn_name_2" {
  description = "(required)"
  type        = string
}
variable "sn_cidr_2" {
  description = "(required)"
  type        = string
}
variable "ti_name_1" {
  description = "(required)"
  type        = string
}
variable "ti_type_1" {
  description = "(required)"
  type        = string
}
variable "ti_tags_1" {
  type        = list
}
variable "ti_zone_1" {
  description = "(required)"
  type        = string
}
variable "ti_image_1" {
  description = "(required)"
  type        = string
}
variable "ti_script_1" {
  description = "(required)"
  type        = string
}