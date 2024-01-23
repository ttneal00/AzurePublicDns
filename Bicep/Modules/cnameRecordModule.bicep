param recordName string
param zoneName string
param cname string
param ttl int = 3600

resource zone 'Microsoft.Network/dnsZones@2018-05-01' existing = {
  name: zoneName
}

resource record 'Microsoft.Network/dnsZones/CNAME@2018-05-01' = {
  parent: zone
  name: recordName
  properties: {
    TTL: ttl
    CNAMERecord: {
      cname: cname
    }
  }
}

output id string = record.id
output fqdn string = record.properties.fqdn
