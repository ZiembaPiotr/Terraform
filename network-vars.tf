variable "network" {
  type    = string
  default = "NestNet"
}

variable "subnet" {
  type = object({
    name = string
    cidr = string
    host_routes = object({
      destination = string
      nexthop     = string
    })
  })

  default = {
    name = "NestedNet-s1"
    cidr = "192.168.2.0/24"
    host_routes = {
      destination = "0.0.0.0/0"
      nexthop     = "192.168.2.1"
    }
  }
}