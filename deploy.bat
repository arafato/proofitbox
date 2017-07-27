@echo off
for /f %%a in ('git rev-parse HEAD') do set "branch=%%a"

set repositoryUrl="https://raw.githubusercontent.com/arafato/proofitbox/%branch%/"

set rg=proofitbox-deployment2
set location=northeurope

call az group create -n %rg% -l %location%

call az group deployment create -g %rg% --template-uri %repositoryUrl%/azuredeploy.json --parameters adminUsername=%1 --parameters adminPassword=%2 --parameters projectPrefix=%3 --parameters repositoryUrl=%repositoryUrl%