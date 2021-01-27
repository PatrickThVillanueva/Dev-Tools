Import-Module .\InstallApps.psm1
Import-Module .\SetupPowerShellProfile.psm1
Import-Module .\KeypirinhaConfigs.psm1

Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');