variable "name" {
  description = "The name of the ELB"
  type        = string
  default     = "test"
}

variable "load_balancer_arn" {
  type    = string
  default = ""
}

variable "target_id" {
  type = list(string)
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
