variable "name" {
  description = "The name of the ELB"
  type        = string
  default     = "test"
}

variable "name_prefix" {
  description = "The prefix name of the ELB"
  type        = string
  default     = null
}

variable "internal" {
  type    = bool
  default = true
}

variable "security_groups" {
  type    = list(string)
  default = [""]
}

variable "subnets" {
  type    = list(string)
  default = [""]
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "enable_deletion_protection" {
  type    = bool
  default = false
}

variable "idle_timeout" {
  type    = number
  default = 3600
}

variable "target_id" {
  default = list(string)
}

variable "listener_port" {
  type    = number
  default = 443
}

variable "listener_protocol" {
  type    = string
  default = ""
}

variable "port" {
  type    = number
  default = 443
}

variable "protocol" {
  type    = string
  default = ""
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "enable_proxy_protocol" {
  type    = bool
  default = true
}
