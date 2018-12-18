$fileName = $args[0]
$resourceGroupName = $args[1]  
$storageAccountName = $args[2]
$storageContainerName = $args[3]
  
### Create Package File
Write-Output "Generating Package for Survey App..."

Compress-Archive ..\src\* $fileName -Force

### Upload Package File
Write-Output "Uploading Survey App Package..."

$storageAccount = Get-AzureRmStorageAccount -Name $storageAccountName -ResourceGroupName $resourceGroupName

Set-AzureStorageBlobContent -File $fileName -Container $storageContainerName -Context $storageAccount.Context 