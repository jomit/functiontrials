### Create Package File
Write-Output "Generating Package for Survey App..."

$fileName = "surveypackagev2.zip"

Compress-Archive ..\src\* $fileName -Force

### Upload Package File
Write-Output "Uploading Survey App Package..."

$storageAccountName = "jomitfuncbuilds"
$storageContainerName = "surveyapp"
$resourceGroup = "FunctionTrials"  

$storageAccount = Get-AzureRmStorageAccount -Name $storageAccountName -ResourceGroupName $resourceGroup

Set-AzureStorageBlobContent -File $fileName -Container $storageContainerName -Context $storageAccount.Context 

### Generate SAS Token
Write-Output "Generating SAS Token..."

$templateuri = New-AzureStorageBlobSASToken -Context $storageAccount.Context  -Container $storageContainerName `
  -Blob $fileName -Permission r `
  -ExpiryTime (Get-Date).AddHours(2.0) -FullUri

# Write-Output $templateuri

### Deploy the ARM Template
New-AzureRmResourceGroupDeployment  -ResourceGroupName $resourceGroup `
  -TemplateFile template.json `
  -packageFileUri $templateuri `
  -TemplateParameterFile parameters.json
  

Write-Output "Done."