# 1. Login to Azure
az login

# 2. Create a Resource Group
az group create --name shifthandover-rg --location eastus

# 3. Create Azure Database for MySQL Flexible Server
az mysql flexible-server create \
  --resource-group shifthandover-rg \
  --name shifthandover-mysql \
  --admin-user mysqladmin \
  --admin-password <YourStrongPassword> \
  --location eastus \
  --sku-name Standard_B1ms \
  --storage-size 32

# 4. Configure MySQL firewall to allow Azure services
az mysql flexible-server firewall-rule create \
  --resource-group shifthandover-rg \
  --name shifthandover-mysql \
  --rule-name AllowAllAzureIPs \
  --start-ip-address 0.0.0.0 \
  --end-ip-address 0.0.0.0

# 5. Create Azure Container Registry (ACR)
az acr create --resource-group shifthandover-rg --name shifthandoveracr --sku Basic

# 6. Login to ACR
az acr login --name shifthandoveracr

# 7. Tag and Push Docker Images
docker tag shift-handover-backend:latest shifthandoveracr.azurecr.io/shift-handover-backend:latest
docker tag shift-handover-frontend:latest shifthandoveracr.azurecr.io/shift-handover-frontend:latest

docker push shifthandoveracr.azurecr.io/shift-handover-backend:latest
docker push shifthandoveracr.azurecr.io/shift-handover-frontend:latest

# 8. Create App Service Plan (Linux)
az appservice plan create --name shifthandover-plan --resource-group shifthandover-rg --is-linux --sku B1

# 9. Create Web App for Backend
az webapp create \
  --resource-group shifthandover-rg \
  --plan shifthandover-plan \
  --name shifthandover-backend-app \
  --deployment-container-image-name shifthandoveracr.azurecr.io/shift-handover-backend:latest

# 10. Create Web App for Frontend
az webapp create \
  --resource-group shifthandover-rg \
  --plan shifthandover-plan \
  --name shifthandover-frontend-app \
  --deployment-container-image-name shifthandoveracr.azurecr.io/shift-handover-frontend:latest

# 11. Configure Web Apps to use ACR credentials
az webapp config container set \
  --name shifthandover-backend-app \
  --resource-group shifthandover-rg \
  --docker-custom-image-name shifthandoveracr.azurecr.io/shift-handover-backend:latest \
  --docker-registry-server-url https://shifthandoveracr.azurecr.io \
  --docker-registry-server-user <ACR_USERNAME> \
  --docker-registry-server-password <ACR_PASSWORD>

az webapp config container set \
  --name shifthandover-frontend-app \
  --resource-group shifthandover-rg \
  --docker-custom-image-name shifthandoveracr.azurecr.io/shift-handover-frontend:latest \
  --docker-registry-server-url https://shifthandoveracr.azurecr.io \
  --docker-registry-server-user <ACR_USERNAME> \
  --docker-registry-server-password <ACR_PASSWORD>

# 12. Set environment variables for each Web App (repeat for frontend/backend as needed)
az webapp config appsettings set \
  --resource-group shifthandover-rg \
  --name shifthandover-backend-app \
  --settings MYSQL_HOST=<mysql-host> MYSQL_USER=mysqladmin MYSQL_PASSWORD=<YourStrongPassword> MYSQL_DATABASE=<your-db> JWT_SECRET=<your-jwt-secret> SMTP_HOST=<smtp-host> SMTP_USER=<smtp-user> SMTP_PASS=<smtp-pass>

# 13. (Optional) Browse to your apps
az webapp browse --resource-group shifthandover-rg --name shifthandover-frontend-app
