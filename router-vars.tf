variable "router" {
    type    = string
    default = "R2"
}

variable "static_routes_R2" {
  type = list(object({
    destination = string
    nexthop     = string
  }))
  default = [
    {
      destination = "0.0.0.0/0"
      nexthop     = "192.168.0.100"
  }]
}