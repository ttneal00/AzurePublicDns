param recordName string
param zoneName string
param srvRecords array
param ttl int
// param mxTarget string


resource zone 'Microsoft.Network/dnsZones@2018-05-01' existing = {
  name: zoneName
}

resource srvrecord 'Microsoft.Network/dnsZones/SRV@2023-07-01-preview' = {
  name: recordName
  parent: zone
  properties: {
    TTL: ttl
    SRVRecords: srvRecords
  }

}

output id string = srvrecord.id
output fqdn string = srvrecord.properties.fqdn
