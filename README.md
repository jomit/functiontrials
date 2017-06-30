# Azure Functions
Azure Functions Sample Code

#Prereq
https://www.npmjs.com/package/azure-functions-core-tools

# Commands
    func init .

    func azure login

    func azure account set <subscription id>

    func new <function name>

    # Update the local.settings.json file with storage and eventhub connections strings.
    # Make ure these settings are in the App Settings of the function app in Azure
    # Update the connection keys in the function.json file inside the function folder

    func host start --debug vscode

    func azure functionapp publish jomitfunctions




