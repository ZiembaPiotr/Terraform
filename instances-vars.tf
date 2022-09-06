variable "ansible_master" {
    type = object({
        name            = string
        flavor_id       = string
        security_groups = list(string)
        image_id        = string
        volume_size     = number
        net_name        = string
    })
    default = {
        name      = "AM"
        flavor_id = "flavor_id"
        security_groups = [
        "wolnaAmerykanka"
        ]
        image_id    = "image_id"
        volume_size = 10
        net_name    = "net_name"
    }
}

variable "ansible_slaves" {
  type = list(object({
    name            = string
    flavor_id       = string
    security_groups = list(string)
    image_id        = string
    volume_size     = number
    net_name        = string
  }))
  default = [
    {
      name      = "AS1"
      flavor_id = "flavor_id"
      security_groups = [
        "SG_name"
      ]
      image_id    = "image_id"
      volume_size = 5
      net_name    = "net_name"
    },
    {
      name      = "AS2"
      flavor_id = "flavor_id"
      security_groups = [
        "SG_name"
      ]
      image_id    = "image_id"
      volume_size = 5
      net_name    = "net_name"
    },
    {
      name      = "AS3"
      flavor_id = "flavor_id"
      security_groups = [
        "SG_name"
      ]
      image_id    = "image_id"
      volume_size = 5
      net_name    = "net_name"
    }
  ]
}
