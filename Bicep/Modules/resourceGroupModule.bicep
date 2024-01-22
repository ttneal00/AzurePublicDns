targetScope = 'subscription'
param rgName string
param location string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgName
  location: location
}

output id string = resourceGroup.id
