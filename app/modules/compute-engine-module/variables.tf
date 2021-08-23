variable "vm_name" {
  description = "vm name (required)"
  type        = string
}
variable "vm_type" {
  description = "vm type (required)"
  type        = string
}
variable "vm_zone" {
  description = "vm zone (required)"
  type        = string
}
variable "vm_image" {
  description = "vm image (required)"
  type        = string
}
variable "vm_script" {
  description = "vm startup script (required)"
  type        = string
}
variable "vm_network" {
  description = "network name (required)"
  type        = string
}
variable "vm_sub_network" {
  description = "subnetwork name (required)"
  type        = string
}