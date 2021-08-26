variable "fr_name" {
  description = "(required)"
  type        = string
}

variable "fr_region" {
  description = "(required)"
  type        = string
}

variable "fr_depends" {
  description = "(required)"
  type        = list
  default     = []
}

variable "fr_protocol" {
  description = "(required)"
  type        = string
}

variable "fr_scheme" {
  description = "(required)"
  type        = string
}

variable "fr_port_range" {
  description = "(required)"
  type        = string
}

variable "fr_target" {
  description = "(required)"
  type        = string
}

variable "fr_network" {
  description = "(required)"
  type        = string
}

variable "fr_subnetwork" {
  description = "(required)"
  type        = string
}

variable "fr_tier" {
  description = "(required)"
  type        = string
}


