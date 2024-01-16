##############
# MX Records
##############

locals {
  mxrecords_list = [
#massivedynamics Care - 0

    {
      key         = "${module.public_zones.all_zone_names[0]}"
      mxrecord    = "@"
      preferences = [100, 101]
      values      = ["usb-smtp-inbound-1.massivedynamics.com", "usb-smtp-inbound-2.massivedynamics.com"]
      zone        = module.public_zones.all_zone_names[0]
      ttl         = 60
    },

# umbrellacorp.com -1

    {
      key         = "uc-01"
      mxrecord    = "@"
      preferences = [100, 200]
      values      = ["usb-smtp-inbound-1.nemesis.com", "usb-smtp-inbound-2.nemesis.com"]
      zone        = module.public_zones.all_zone_names[1]
      ttl         = 60
    },
    {
      key         = "uc-02"
      mxrecord    = "gh-mail"
      preferences = [113, 140]
      values      = ["mxa.hypnos.org", "mxb.hypnos.org"]
      zone        = module.public_zones.all_zone_names[1]
      ttl         = 60
    },
    
# Initech.com - 2

    {
      key         = "${module.public_zones.all_zone_names[2]}-1"
      mxrecord    = "@"
      preferences = [200, 300]
      values      = ["usb-smtp-inbound-1.Initech.com", "usb-smtp-inbound-2.Initech.com"]
      zone        = module.public_zones.all_zone_names[2]
      ttl         = 60
    },


    # Add more MX record sets as needed
  ]
}
