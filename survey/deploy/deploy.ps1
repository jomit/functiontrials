# Connect-AzureRmAccount
# Set-AzureRmContext -SubscriptionId ""

$location = "westus"
$resourceGroupName = "FunctionTrials"  
$storageAccountName = "jomitfuncbuilds"
$storageContainerName = "surveyapp"
$packageFileName = "surveyapp-0.1.zip"

. .\CreatePackageStorageAccount.ps1 $location $resourceGroupName $storageAccountName $storageContainerName

. .\CreatePackage.ps1 $packageFileName $resourceGroupName $storageAccountName $storageContainerName

. .\DeployFunctionApp.ps1 $packageFileName $resourceGroupName $storageAccountName $storageContainerName