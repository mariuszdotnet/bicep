param location string = resourceGroup().location
param backupStorage bool = false

module storage './storage.bicep' = {
  name: 'storageDeploymentMain'
  params:{
    location: location
    name: 'mkuniquestorage01'
  }
}

module storageBackup './storage.bicep' = if(backupStorage) {
  name: 'storageDeploymentBackup'
  params:{
    location: location
    name: 'mkuniquestorage02'
  }
}
