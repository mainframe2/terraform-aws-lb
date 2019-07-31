variable "enable_proxy_protocol" {
  type    = bool
  default = true
}

variable "instances" {
  type    = list
  default = [""]
}

variable "load_balancer_arn" {
  type    = string
  default = ""
}

variable "listener_port" {
  type    = number
  default = 443
}

variable "listener_protocol" {
  type    = string
  default = ""
}

variable "name" {
  description = "The name of the ELB"
  type        = string
  default     = "test"
}

variable "number_of_instances" {
  type    = number
  default = 1
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
