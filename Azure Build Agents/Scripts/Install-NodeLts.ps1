################################################################################
##  File:  Install-NodeLts.ps1
##  Team:  CI-X
##  Desc:  Install nodejs-lts and other common node tools.
##         Must run after python is configured
##  From: https://github.com/Microsoft/azure-pipelines-image-generation/blob/master/images/win/scripts/Installers/Install-NodeLts.ps1
################################################################################

Import-Module -Name ImageHelpers -Force

$PrefixPath = 'C:\npm\prefix'
$CachePath = 'C:\npm\cache'

New-Item -Path $PrefixPath -Force -ItemType Directory
New-Item -Path $CachePath -Force -ItemType Directory

choco install nodejs-lts -y --force

Add-MachinePathItem $PrefixPath
$env:Path = Get-MachinePath

setx NPM_CONFIG_PREFIX $PrefixPath /M
$env:NPM_CONFIG_PREFIX = $PrefixPath

setx NPM_CONFIG_CACHE $CachePath /M
$env:NPM_CONFIG_CACHE = $CachePath

npm config set registry http://registry.npmjs.org/
npm install -g npm

npm install -g bower
npm install -g cordova
npm install -g grunt-cli
npm install -g gulp-cli
npm install -g parcel-bundler
npm install -g --save-dev webpack webpack-cli
npm install -g yarn