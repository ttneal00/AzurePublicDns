param recordName string
param zoneName string
param mxRecords array
param ttl int

resource zone 'Microsoft.Network/dnsZones@2018-05-01' existing = {
  name: zoneName
}

resource mxrecord 'Microsoft.Network/dnsZones/MX@2023-07-01-preview' = {
  name: recordName
  parent: zone
  properties: {
    TTL: ttl
    MXRecords: mxRecords
  }

}

output id string = mxrecord.id
output fqdn string = mxrecord.properties.fqdn

