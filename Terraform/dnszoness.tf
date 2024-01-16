#Zones

locals {

  dnszones = [
    {
        key = "md"
        name                = "massivedynamics.com"
    },
    {
      key = "uc"
        name                = "umbrellacorp.com"
    },
    {
      key = "ct"
        name                = "Initech.com"
    },
  ]
}