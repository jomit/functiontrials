### Create Storage Account and Container
Write-Output "Creating Storage Account and Container..."

$location = $args[0]
$resourceGroupName = $args[1]  
$storageAccountName = $args[2]
$storageContainerName = $args[3]
$skuName = "Standard_LRS"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $location 

$storageAccount = New-AzureRmStorageAccount -ResourceGroupName $resourceGroupName `
 -Name $storageAccountName `
 -Location $location `
 -SkuName $skuName

New-AzureStorageContainer -Name $storageContainerName -Context $storageAccount.Context -Permission Off