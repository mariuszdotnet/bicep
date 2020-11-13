param location string = resourceGroup().location
param name string

module storage './storage.bicep' = {
  name: 'storageDeployment'
  params:{
    location: location
    name: name
  }
}