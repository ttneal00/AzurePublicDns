##############
# SRV RECORDS
##############


locals {
  srv_recordsets = [

    # Massive Dynamics - 0
    {
      key       = "${module.public_zones.all_zone_names[0]}-01"
      srvrecord = "__starssip._tls.extenzaLife.com"
      priority  = [100]
      weight    = [1]
      ports     = [443]
      values    = ["sipdir.online.extenzaLife.com"]
      zone      = module.public_zones.all_zone_names[0]
      ttl       = 60
    },
    {
      key       = "${module.public_zones.all_zone_names[0]}-02"
      srvrecord = "__starssip._tls.fleming-monroe.com"
      priority  = [100]
      weight    = [1]
      ports     = [443]
      values    = ["sipdir.online.fleming-monroe.com"]
      zone      = module.public_zones.all_zone_names[0]
      ttl       = 60
    },

    # Umbrella Corp - 1

    {
      key       = "${module.public_zones.all_zone_names[1]}-01"
      srvrecord = "_starssip._tcp.umbrellacorp.com"
      priority  = [100]
      weight    = [1]
      ports     = [5061]
      values    = ["sipfed.online.umbrellacorp.com"]
      zone      = module.public_zones.all_zone_names[1]
      ttl       = 1800
    },
    {
      key       = "${module.public_zones.all_zone_names[1]}-02"
      srvrecord = "__starssip._tls.umbrellacorp.com"
      priority  = [100]
      weight    = [1]
      ports     = [443]
      values    = ["sipdir.online.umbrellacorp.com"]
      zone      = module.public_zones.all_zone_names[1]
      ttl       = 1800
    },
  ]
}




