param recordName string
param zoneName string
param ipv4Address string
param ttl int = 3600

resource zone 'Microsoft.Network/dnsZones@2018-05-01' existing = {
  name: zoneName
}

resource record 'Microsoft.Network/dnsZones/A@2018-05-01' = {
  parent: zone
  name: recordName
  properties: {
    TTL: ttl
    ARecords: [
      {
        ipv4Address: ipv4Address
      }
    ]
  }
}

output id string = record.id
output fqdn string = record.properties.fqdn
