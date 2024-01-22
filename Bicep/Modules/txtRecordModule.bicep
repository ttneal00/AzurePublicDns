param recordName string
param zoneName string
param txtRecords array
param ttl int
// param mxTarget string


resource zone 'Microsoft.Network/dnsZones@2018-05-01' existing = {
  name: zoneName
}

resource txtrecord 'Microsoft.Network/dnsZones/TXT@2023-07-01-preview' = {
  name: recordName
  parent: zone
  properties: {
    TTL: ttl
    TXTRecords:  txtRecords
  }

}

output id string = txtrecord.id
output fqdn string = txtrecord.properties.fqdn
