#!/bin/bash

# Examples from https://github.com/Azure/bicep


# 1. Compile an empty bicep file
bicep build main.bicep

# 2. Add a resource and compile the bicep file

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
    name: 'uniquestorage001' // must be globally unique
    location: 'eastus'
    kind: 'Storage'
    sku: {
        name: 'Standard_LRS'
    }
}

# 3. Add parameters

param location string = 'eastus'
param name string = 'mkuniquestorage001' // must be globally unique

# 4. Add variables and outputs

var storageSku = 'Standard_LRS' // declare variable and assign value

output storageId string = stg.id // output resourceId of storage account

# 5. Compile your bicep file and deploy the template to a resource group

# Via AZ CLI:
bicep build ./main.bicep

az login
az account list --output table
az account set --subscription "Mariusz - MS Internal Consumption"

az group create -n mybicep-rg -l eastus --verbose # optional - create resource group 'my-rg'
az deployment group create -f ./main.json -g mybicep-rg --verbose

# 6. Pass parameters on the command line
az deployment group create -f ./main.json -g mybicep-rg --parameters location=westus name=mklogstorage001

# 7. Modules

bicep build ./main2.bicep

az group create -n mybicep-rg -l eastus --verbose
az deployment group create -f ./main2.json -g mybicep-rg --parameters location=westus name=mkstoragemudule003