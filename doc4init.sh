


# --------------------------
# Step 4: GitHub Secrets
# --------------------------

# GitHub Actions uses OIDC to authenticate directly to Azure without storing credentials.
# Secrets must be added to GitHub repository and environment settings.

# Repository-level secrets (available to all workflows):
# These must be manually added in your GitHub repository under:
# Settings > Secrets and variables > Actions > Repository secrets

# Required secrets:
# 1. AZURE_TENANT_ID        - Output of: az account show --query tenantId -o tsv
# 2. AZURE_SUBSCRIPTION_ID  - Output of: az account show --query id -o tsv
# 3. AZURE_CLIENT_ID        - The Reader appId (use $appIdR)
# 4. ARM_ACCESS_KEY         - From tf-backend output: terraform output -raw arm_access_key

# Environment-level secrets (for the 'production' environment only):
# These override repository-level secrets within the environment.
# Set in: Settings > Environments > production > Add secret

# Required environment secret:
# 1. AZURE_CLIENT_ID        - The Contributor appId (use $appIdRW)

# Note: Secret names must match exactly in your workflow files (e.g. terraform-deploy.yml)