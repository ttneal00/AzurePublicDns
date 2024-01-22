targetScope = 'subscription'
param aRecords array
param mxRecords array
param txtRecords array
param cNameRecords array
param srvRecords array
param dnsZones array

module PubDnsRg 'Modules/resourceGroupModule.bicep' = {
  name: 'pubDNStest'
  params: {
    location: 'Central US'
    rgName: 'pubDNStest'
  }
}

module dnsZone 'Modules/dnsZoneModule.bicep' = [for zone in dnsZones:  {
  name: zone.name
  scope: resourceGroup(PubDnsRg.name)
  params: {
    zoneName: zone.name
  }

}]

module aRecord 'Modules/aRecordModule.bicep' = [for record in aRecords:  { 
 name: record.name
 scope: resourceGroup(PubDnsRg.name)
 params: {
  recordName: record.name
  zoneName: record.zoneName
  ipv4Address: record.ip
  ttl: record.ttl
 }
 dependsOn: [
  dnsZone
 ]
}]

module cNameRecord 'Modules/cnameRecordModule.bicep' = [for record in cNameRecords:  { 
  name: record.name
  scope: resourceGroup(PubDnsRg.name)
  params: {
   recordName: record.name
   zoneName: record.zoneName
   target: record.target
   ttl: record.ttl
  }
  dependsOn: [
    dnsZone
   ]
 }]

module mxRecord 'Modules/mxRecordModule.bicep' = [for (record, index) in mxRecords: {
    name: record.key
    scope: resourceGroup(PubDnsRg.name)
    params: {
      ttl: record.ttl
      mxRecords: record.values
      recordName: record.recordName
      zoneName: record.zonename
    } 
    dependsOn: [
      dnsZone
     ]
}]

module txtRecord 'Modules/txtRecordModule.bicep' = [for (record, index) in txtRecords: {
  name: record.key
  scope: resourceGroup(PubDnsRg.name)
  params: {
    ttl: record.ttl
    txtRecords: record.targets
    recordName: record.recordName
    zoneName: record.zonename
  } 
  dependsOn: [
    dnsZone
   ]
}]

module srvRecord 'Modules/srvRecordModule.bicep' = [for (record, index) in srvRecords: {
  name: record.key
  scope: resourceGroup(PubDnsRg.name)
  params: {
    ttl: record.ttl
    srvRecords: record.values
    recordName: record.recordName
    zoneName: record.zonename
  } 
  dependsOn: [
    dnsZone
   ]
}]

