# cst8918-w25-lab12

```bash
az group create --name ren00055-cst8918-tf-backend --location westus3


az storage account create \
--name ren00055tfstorage \
--resource-group ren00055-cst8918-tf-backend \
--location westus3 --sku Standard_LRS

az storage container create --name tfstate --account-name ren00055tfstorage


az storage account keys list --account-name ren00055tfstorage --resource-group ren00055-cst8918-tf-backend





terraform fmt && terraform validate && terraform plan -out=a12.tfplan


terraform apply a12.tfplan


```
