. .\InstallApps.ps1
. .\SetupPowerShellProfile.ps1

if (choco list -lo 'Keypirinha').Contains('1 packages installed.')
{
    $configPath = $env:AppData + "\Keypirinha\User"
    $localKPConfigs = "\Keystroke Launcher\Keypirinha Configs\"
    $files = Get-ChildItem $localKPConfigs
    foreach($file in $files)
    {
        Copy-Item $file -Destination $configPath
    }

    $installPath = $env:AppData + "\Keypirinha\InstalledPackages"
    $localKPPackages = "\Keystroke Launcher\InstalledPackages\"
    $files = Get-ChildItem $localKPPackages
    foreach($file in $files)
    {
        Copy-Item $file -Destination $installPath
    }
}