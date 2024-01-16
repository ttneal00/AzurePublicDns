### Resource Group Creations

module "dns_resource_group" {
  source           = "./Modules/resourceGroup"
  DnsResourceGroup = local.dns_resource_group_name
  location         = var.location
  tags             = local.tags
}

### Zone Creations

module "public_zones" {
  source              = "./Modules/dnsZones"
  resource_group_name = module.dns_resource_group.name
  dnszones = local.dnszones
}

### Record Creations

module "Arecords" {
  source              = "./Modules/Records/A"
  for_each            = { for record in local.arecords_list : record.key => record }
  resource_group_name = module.dns_resource_group.name
  record              = each.value.arecord
  zone_name           = each.value.zone
  ttl                 = each.value.ttl
  values              = each.value.values
  depends_on = [module.public_zones]
}

module "CNAMErecords" {
  source              = "./Modules/Records/CNAME"
  for_each            = { for record in local.cnamerecords_list : record.key => record }
  resource_group_name = module.dns_resource_group.name
  record              = each.value.cnamerecord
  zone_name           = each.value.zone
  ttl                 = each.value.ttl
  values              = each.value.values
  depends_on = [module.public_zones]
}



module "MXrecords" {
  source              = "./Modules/Records/MX"
  resource_group_name = module.dns_resource_group.name
  mx_records          = local.mxrecords_list
    depends_on = [module.public_zones]
}

module "Srvrecords" {
  source              = "./Modules/Records/SRV"
  resource_group_name = module.dns_resource_group.name
  srv_records         = local.srv_recordsets
    depends_on = [module.public_zones]
}

module "Txtrecords" {
  source              = "./Modules/Records/TXT"
  resource_group_name = module.dns_resource_group.name
  txt_records         = local.txtrecords
    depends_on = [module.public_zones]
}