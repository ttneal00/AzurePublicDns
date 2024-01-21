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
  dnszones            = local.dnszones
}

### Record Creations

module "Arecords" {
  source              = "./Modules/Records/A"
  resource_group_name = module.dns_resource_group.name
  host_records        = local.a_records_list
}

module "CNAMErecords" {
  source              = "./Modules/Records/CNAME"
  resource_group_name = module.dns_resource_group.name
  cname_records       = local.cname_records_list
}



module "MXrecords" {
  source              = "./Modules/Records/MX"
  resource_group_name = module.dns_resource_group.name
  mx_records          = local.mxrecords_list
  depends_on          = [module.public_zones]
}

module "Srvrecords" {
  source              = "./Modules/Records/SRV"
  resource_group_name = module.dns_resource_group.name
  srv_records         = local.srv_recordsets
  depends_on          = [module.public_zones]
}

module "Txtrecords" {
  source              = "./Modules/Records/TXT"
  resource_group_name = module.dns_resource_group.name
  txt_records         = local.txtrecords
  depends_on          = [module.public_zones]
}