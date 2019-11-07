variable "enable_deletion_protection" {
  type    = bool
  default = false
}

variable "idle_timeout" {
  type    = number
  default = 3600
}

variable "internal" {
  type    = bool
  default = true
}

variable "name" {
  description = "The name of the ELB"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "The prefix name of the ELB"
  type        = string
  default     = null
}

variable "security_groups" {
  type    = list(string)
  default = [""]
}

variable "subnets" {
  type    = list(string)
  default = [""]
}

variable "subnet_mapping" {
  type = list(map(string))
}

variable "tags" {
  type    = map(string)
  default = {}
}
