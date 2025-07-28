#! /bin/bash



# Create the Azure AD federated credential
az ad app create --display-name ren00055-githubactions-rw

export appIdRW=<appId>

az ad sp create --id $appIdRW

export assigneeObjectId=$(az ad sp show --id $appIdRW --query id -o tsv)

az role assignment create \
  --role contributor \
  --subscription $subscriptionId \
  --assignee-object-id $assigneeObjectId \
  --assignee-principal-type ServicePrincipal \
  --scope /subscriptions/$subscriptionId/resourceGroups/$resourceGroupName

az ad app create --display-name ren00055-githubactions-r
export appIdR=<appId>
az ad sp create --id $appIdR

export assigneeObjectId=$(az ad sp show --id $appIdR --query id -o tsv)


az role assignment create \
  --role reader \
  --subscription $subscriptionId \
  --assignee-object-id $assigneeObjectId \
  --assignee-principal-type ServicePrincipal \
  --scope /subscriptions/$subscriptionId/resourceGroups/$resourceGroupName



