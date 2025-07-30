#! /bin/bash

export subscriptionId=$(az account show --query id -o tsv)
export tenantId=$(az account show --query tenantId -o tsv)


# Create the Azure AD federated credential
az ad app create --display-name ren00055-githubactions-rw

export appIdRW="bb7a6927-c340-4ae0-85ea-3cfb355d8a74"

az ad sp create --id $appIdRW

export assigneeObjectId=$(az ad sp show --id $appIdRW --query id -o tsv)

az role assignment create \
  --role contributor \
  --subscription $subscriptionId \
  --assignee-object-id $assigneeObjectId \
  --assignee-principal-type ServicePrincipal \
  --scope /subscriptions/$subscriptionId/resourceGroups/$resourceGroupName

az ad app create --display-name ren00055-githubactions-r
export appIdR="9503b487-e52b-43ff-aba7-9a453bd0fe69"
az ad sp create --id $appIdR

export assigneeObjectId=$(az ad sp show --id $appIdR --query id -o tsv)


az role assignment create \
  --role reader \
  --subscription $subscriptionId \
  --assignee-object-id $assigneeObjectId \
  --assignee-principal-type ServicePrincipal \
  --scope /subscriptions/$subscriptionId/resourceGroups/$resourceGroupName


## ---------

mkdir -p infra/az-federated-credential-params


# in the infra folder
az ad app federated-credential create \
  --id $appIdRW \
  --parameters infra/az-federated-credential-params/production-deploy.json


# in the infra folder
az ad app federated-credential create \
  --id $appIdR \
  --parameters infra/az-federated-credential-params/pull-request.json


# in the infra folder
az ad app federated-credential create \
  --id $appIdR \
  --parameters infra/az-federated-credential-params/branch-main.json