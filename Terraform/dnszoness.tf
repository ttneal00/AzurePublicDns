#Zones

locals {

  dnszones = [
    {
      key  = "000"
      name = "massivedynamics.com"
    },
    {
      key  = "001"
      name = "umbrellacorp.com"
    },
    {
      key  = "002"
      name = "Initech.com"
    },
    # Add more dns zones as needed
  ]
}