#############
# A RECORDS
#############

locals {
  a_records_list = [

    # massivedynamics.com - 0

    {
      key      = "${module.public_zones.all_zone_names[0]}-1"
      a_record = "www"
      values   = ["3.0.0.3"]
      zone     = module.public_zones.all_zone_names[0]
      ttl      = 3600
    },

    # umbrellacorp.com - 1


    {
      key      = "${module.public_zones.all_zone_names[1]}-2"
      a_record = "www"
      values   = ["2.0.0.2"]
      zone     = module.public_zones.all_zone_names[1]
      ttl      = 3600
    },

    #Initech.com - 2

    {
      key      = "${module.public_zones.all_zone_names[2]}-1"
      a_record = "www"
      values   = ["1.0.0.1"]
      zone     = module.public_zones.all_zone_names[2]
      ttl      = 3600
    },
  ]
}





