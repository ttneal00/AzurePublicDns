################
# CNAMES
################

locals {
  cname_records_list = [

    # massivedynamics.com - 0

    {
      key          = "${module.public_zones.all_zone_names[0]}-1"
      cname_record = "autodiscover"
      values       = "autodiscover.massivelogistic.com"
      zone         = module.public_zones.all_zone_names[0]
      ttl          = 180
    },

    # umbrellacorp.com - 1

    {
      key          = "${module.public_zones.all_zone_names[1]}-2"
      cname_record = "cdnverify.zealots"
      values       = "cdnverify.umbrellacorp.cerberus.net"
      zone         = module.public_zones.all_zone_names[1]
      ttl          = 180
    },

    # Initech.com -2


    {
      key          = "${module.public_zones.all_zone_names[2]}-1"
      cname_record = "f6hkKeVcvvQ1CHVwca6kNWG8Gp1"
      values       = "dcv.Initechcert.com"
      zone         = module.public_zones.all_zone_names[2]
      ttl          = 3600
    },
  ]
}