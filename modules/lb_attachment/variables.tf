variable "enable_proxy_protocol" {
  type    = bool
  default = true
}

variable "instances" {
  type    = list
  default = [""]
}

variable "listener" {
  description = "A list of listener blocks"
  type        = list(map(string))
}

variable "load_balancer_arn" {
  type    = string
  default = ""
}

variable "name" {
  description = "The name of the ELB"
  type        = string
  default     = null
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

variable "target_type" {
  type    = string
  default = "ip"
}

variable "vpc_id" {
  type    = string
  default = ""
}
