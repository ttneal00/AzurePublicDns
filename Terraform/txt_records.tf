
locals {

  # massivedyamics.com - 0
  txtrecords = [
    {
      key       = "${module.public_zones.all_zone_names[0]}-0"
      txtrecord = "@"
      values = [
        "v=spf1 include:spf.protection.outlook.com include:usb._netblocks.mimecast.com include:nw026.com include:nw027.com include:nw028.com include:emailus.freshservice.com include:mg-spf.greenhouse.io include:rp.oracleemaildelivery.com ~all",
        "uc=ucJupER9Uyg",
        "elppa-domain-verification=MGNcyKAUTC0rrZ",
        "MOOZ_verify_649uu9bgwXh7NLKibBgouYcfD5ieT",
        "mdfoundation-domain-verification=JTi2sDRuraVFuwF7fxrzFA15zgQDqX0nTFY9x8Qo450qKtRAFhiy36LifU3Z8spksK"
      ]
      zone = module.public_zones.all_zone_names[0]
      ttl  = 3600
    },
    {
      key       = "${module.public_zones.all_zone_names[0]}-1"
      txtrecord = "_dmarc"
      values    = ["v=DMARC1; p=none; rua=mailto:dmarc_agg@massivelogistic.com; ruf=mailto:dmarc_for@massivelogistic.com; fo=1"]
      zone      = module.public_zones.all_zone_names[0]
      ttl       = 3600
    },

    # umbrellacorp.com - 1

    {
      key       = "${module.public_zones.all_zone_names[1]}-0"
      txtrecord = "9eqtue6uxumx0efgxrslq._domainkey"
      values = ["v=DKIM1;p=DDCyJiiTwoF3B3QLpcWYoXwynBKiC4CkTz5XjLG0rLH6xVhqKUVam0up5cXHyEMNWeruvGaPVeTN4AH4NV1j54TP0eXr1XNyvRER",
      "cQEPEA1LAJbLVTpiAbuBWZXKLeEC3yKWNcA0fAT46suFaWBWJFVjHfx4c9XgnUbDjBVXRm0o9uNnrpJXGZwuG3rCUY51ueRcqYs9"]
      zone = module.public_zones.all_zone_names[1]
      ttl  = 3600
    },
    {
      key       = "${module.public_zones.all_zone_names[1]}-1"
      txtrecord = "@"
      values = ["tvVjmvFbDEsDt3PaGmQUH3q7UEQjCbo", "neptune-site-verification=QWn6gJx5P1hcgJXekCczasmw2pMX6NQCZEUu6Fnu5RLbkNJb-r6z3vJaQ",
        "md=ucTvcNne0tU", "v=spf1 include:nyx.org include:spf.protection.garrador.com include:usb._netblocks.mimecast.com  include:umbrella-com.spf.smtp258.com ~all",
        "bandersnatch_verification_token=C24FE082863254F899D681B27847735825", "pluto-site-verification=b875ca0b846dc584f79a94ee1f990d63",
        "v=DMARC1; p=quarantine; rua=mailto:dmarc_agg@cockroach.com; ruf=mailto:dmarc_for@cockroach.com; fo=1"
      ]
      zone = module.public_zones.all_zone_names[1]
      ttl  = 3600
    },


    {
      key       = "${module.public_zones.all_zone_names[1]}-2"
      txtrecord = "@"
      values = ["tvVjmvFbDEsDt3PaGmQUH3q7UEQjCbo", "neptune-site-verification=QWn6gJx5P1hcgJXekCczasmw2pMX6NQCZEUu6Fnu5RLbkNJb-r6z3vJaQ",
        "uc=ucTvcNne0tU", "v=spf1 include:nyx.org include:spf.protection.garrador.com include:usb._netblocks.mimecast.com  include:umbrella-com.spf.smtp258.com ~all",
        "bandersnatch_verification_token=C24FE08286376254F899D68881B27847735825", "pluto-site-verification=b875ca0areiib846dgc584f79a94ee1f990d63",
        "v=DMARC1; p=quarantine; rua=mailto:dmarc_agg@cockroach.com; ruf=mailto:dmarc_for@cockroach.com; fo=1"
      ]
      zone = module.public_zones.all_zone_names[1]
      ttl  = 3600
    },

    # Initech -2

    {
      key       = "${module.public_zones.all_zone_names[2]}-0"
      txtrecord = "_dmarc"
      values    = ["v=DMARC1; p=quarantine; rua=mailto:dmarc_agg@Initech.com; ruf=mailto:dmarc_for@Initech.com; fo=1"]
      zone      = module.public_zones.all_zone_names[2]
      ttl       = 3600
    },
    # add additional TXT Records Below

  ]
}



