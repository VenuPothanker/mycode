variable "container_name" {
  description = "Value of the name for the Docker container"
  # basic types include string, number and bool
  type        = string
  default     = "ExampleNginxContainer"
}

variable "int_port" {
  type = number
  default = 80
}

variable "ext_port" {
  type = number
  default = 2224
}
