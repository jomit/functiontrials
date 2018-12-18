### Create Storage Account and Container
Write-Output "Creating Storage Account and Container..."

# Connect-AzureRmAccount

# Set-AzureRmContext -SubscriptionId ""

$location = "westus"
$resourceGroup = "FunctionTrials"  
$storageAccountName = "jomitfuncbuilds"
$storageContainerName = "surveyapp"
$skuName = "Standard_LRS"

# New-AzureRmResourceGroup -Name $resourceGroup -Location $location 

$storageAccount = New-AzureRmStorageAccount -ResourceGroupName $resourceGroup `
 -Name $storageAccountName `
 -Location $location `
 -SkuName $skuName

New-AzureStorageContainer -Name $storageContainerName -Context $storageAccount.Context -Permission Off