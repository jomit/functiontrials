$fileName = $args[0]
$resourceGroupName = $args[1]  
$storageAccountName = $args[2]
$storageContainerName = $args[3]

$storageAccount = Get-AzureRmStorageAccount -Name $storageAccountName -ResourceGroupName $resourceGroupName

### Generate SAS Token
Write-Output "Generating SAS Token..."

$templateuri = New-AzureStorageBlobSASToken -Context $storageAccount.Context  -Container $storageContainerName `
  -Blob $fileName -Permission r `
  -ExpiryTime (Get-Date).AddHours(1.0) -FullUri

Write-Output "Deploying Function App..."

### Deploy the ARM Template
New-AzureRmResourceGroupDeployment  -ResourceGroupName $resourceGroupName `
  -TemplateFile template.json `
  -packageFileUri $templateuri `
  -TemplateParameterFile parameters.json