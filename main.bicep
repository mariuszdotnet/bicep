param location string = 'eastus'
param name string = 'mkuniquestorage01' // must be globally unique

var storageSku = 'Standard_LRS' // declare variable and assign value
output storageId string = stg.id // output resourceId of storage account

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' ={
  name: name
  location: location
  kind: 'StorageV2'
  sku:{
    name: storageSku
  }
}
