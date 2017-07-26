echo off
for /f %%a in ('git rev-parse HEAD') do set "branch=%%a"

set repositoryUrl="https://raw.githubusercontent.com/arafato/proofitbox/%branch%"

set rg=proofitbox-deployment
set location=northeurope

az group create -n %rg% -l %location%

az group deployment create -g %rg% --template-uri %repositoryUrl%/azuredeploy.json --parameters adminUsername=%1 --parameters password=%2 --parameters prefix=%3 --parameters repositoryUrl=%repositoryUrl%