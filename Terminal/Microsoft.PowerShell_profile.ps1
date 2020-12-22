Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

del alias:gm -Force

function Get-GitStatus { & git status $args }
New-Alias -Name gs -Value Get-GitStatus

function Get-GitCheckout { & git checkout $args }
New-Alias -Name gc -Value Get-GitCheckout -Force -Option AllScope

function Get-GitPull { & git pull }
New-Alias -Name gpl -Value Get-GitPull

function Get-GitMerge { & git merge $args --no-ff}
New-Alias -Name gm -Value Get-GitMerge

function Get-GitBranch { & git branch }
New-Alias -Name gb -Value Get-GitBranch

function Get-GitBranchRemote { & git branch -r }
New-Alias -Name gbr -Value Get-GitBranchRemote

function Go-ToDev { & cd C:\Dev }
New-Alias -Name 'cddev' -Value Go-ToDev

function Go-ToSpectraApi { & cd C:\Dev\Spectra\SpectraAPI }
New-Alias -Name 'cdapi' -Value Go-ToSpectraApi 

New-Alias -Name staging -Value develop

function Make-Directory { New-Item -ItemType "Directory" -Name "$args" }
New-Alias -Name 'makedir' -Value Make-Directory 

function Make-EmptyFile { New-Item -ItemType "file" -Name "$args" }
New-Alias -Name 'touch' -Value Make-EmptyFile

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
