$modules = "posh-git", "oh-my-posh"

foreach ($module in $modules){
  if (Get-Module -ListAvailable -Name $module) {
  }
  else{
    Install-Module $module
  }

  Import-Module $module
}

Set-PoshPrompt slimfat

del alias:gm -Force
del alias:gl -Force

function Invoke-LinqPadScript
{
    [CmdletBinding()]
    Param
    (
        [parameter(mandatory=$true, position=0)][string]$ScriptName,
        [parameter(mandatory=$false, position=1, ValueFromRemainingArguments=$true)]$AllArgs
    )

    if (!(Get-Command "lprun7" -errorAction SilentlyContinue)) {
        write-host "You need lprun.exe, on the PATH, to be able to use this module." -foregroundcolor "red"
        return;
    }

    $fullScriptPath = ("{0}\{1}.linq" -f "C:\Users\f59ptv\Documents\LINQPad Queries", $ScriptName);

    if (!(test-path $fullScriptPath)) {
        write-host  ("No script found " + $fullScriptPath) -foregroundcolor "red"
        return;
    }

    & lprun7 $fullScriptPath $AllArgs
}
New-Alias -Name linq -Value Invoke-LinqPadScript

function Get-LinqPadScript
{
    [CmdletBinding()]
    Param
    (
        [parameter(mandatory=$false, position=0)][string]$ScriptName
    )

    $linqPadScriptPath = ("{0}" -f "C:\Users\f59ptv\Documents\LINQPad Queries");

    if ($scriptName -ne $null) {
        Get-ChildItem $linqPadScriptPath  *.linq |
            ? { $_.BaseName -match $scriptName } |
            Format-Table -property  @{Expression={$_.BaseName};Label="Script"} -auto
    } else {
        Get-ChildItem $linqPadScriptPath  *.linq |
            Format-Table -property  @{Expression={$_.BaseName};Label="Script"} -auto
    }
}
New-Alias -Name linqlist -Value Get-LinqPadScript

function Delete-Folder { & Remove-Item $args -Recurse -Force }
New-Alias -Name remove -Value Delete-Folder

function Get-GitStatus { & git status $args }
New-Alias -Name gs -Value Get-GitStatus

function Get-GitCheckout { & git checkout $args }
New-Alias -Name gc -Value Get-GitCheckout -Force -Option AllScope

function Get-GitBranchRemote { & git branch -r }
New-Alias -Name gbr -Value Get-GitBranchRemote

function Get-GitPull { & git pull }
New-Alias -Name gpl -Value Get-GitPull

function Put-GitRestore { & git restore . }
New-Alias -Name gr -Value Put-GitRestore

function GitDiff { & git diff $args -w }
New-Alias -Name gd -Value GitDiff

function Put-GitFeature { & git checkout -b feature/$args }
New-Alias -Name gf -Value Put-GitFeature

function Put-GitBug { & git checkout -b bug/$args }
New-Alias -Name gbug -Value Put-GitBug

function GitCommit { & git add .; git commit -am $args }
New-Alias -Name gcom -Value GitCommit

function GitLog { & git log }
New-Alias -Name gl -Value GitLog

function Get-GitMerge { & git merge $args --no-ff}
New-Alias -Name gm -Value Get-GitMerge

function Get-GitBranch { & git branch }
New-Alias -Name gb -Value Get-GitBranch

function Delete-GitBranch { & git branch -D $args }
New-Alias -Name gbd -Value Delete-GitBranch

function Delete-GitBranchRemote { & git push origin --delete $args }
New-Alias -Name gbdR -Value Delete-GitBranchRemote

function New-PR {
  $curBranch = git symbolic-ref HEAD 2> /dev/null;
  $curBranch = $curBranch -replace 'refs/heads/',''

  $curRepo = Get-Location
  $curRepoArr = $curRepo.Path.Split("\");
  $curRepo = $curRepoArr[-1]

  Start-Process "https://dev.azure.com/FTZ-Cloud/FTZ%20Plus/_git/$curRepo/pullrequestcreate?sourceRef=$curBranch&targetRef=master"
}
New-Alias -Name pr -Value New-PR

function ViewWorkItem {
  $itemNumber = $args
  Start-Process "https://dev.azure.com/ftz-cloud/FTZ%20Plus/_workitems/edit/$itemNumber"
}
New-Alias -name 'view' -value ViewWorkItem

function Go-ToCaseApi { & cd C:\git\CaseApi }
New-Alias -Name 'caseapi' -Value Go-ToCaseApi

function Go-ToGit { & cd C:\git\ }
New-Alias -Name 'dev' -Value Go-ToGit

function Go-ToCoreApi { & cd C:\git\CoreApi }
New-Alias -Name 'coreapi' -Value Go-ToCoreApi

function Go-ToCaseEvent { & cd C:\git\CaseEventHandler }
New-Alias -Name 'caseevent' -Value Go-ToCaseEvent

function Go-ToAccountingApi { & cd C:\git\AccountingApi }
New-Alias -Name 'accounting' -Value Go-ToAccountingApi

function Go-ToInsuranceApi { & cd C:\git\InsuranceApi }
New-Alias -Name 'insurance' -Value Go-ToInsuranceApi

function Go-ToReportApi { & cd C:\git\ReportApi }
New-Alias -Name 'report' -Value Go-ToReportApi

function Go-ToNotificationApi { & cd C:\git\NotificationApi }
New-Alias -Name 'notification' -Value Go-ToNotificationApi

function Go-ToFrontend { & cd C:\git\FtzPlusFrontend }
New-Alias -Name 'frontend' -Value Go-ToFrontend

function Go-ToCommon { & cd C:\git\Ftz.AspNetCore.Common }
New-Alias -Name 'common' -Value Go-ToCommon

function Go-ToTWM { & cd C:\git\FtzPlus }
New-Alias -Name 'twm' -Value Go-ToTWM

function Make-Directory { New-Item -ItemType "Directory" -Name "$args" }
New-Alias -Name 'makedir' -Value Make-Directory 

function Make-EmptyFile { New-Item -ItemType "file" -Name "$args" }
New-Alias -Name 'touch' -Value Make-EmptyFile

#Paths need to be updated
function Make-KeypirinhaPlugin {& "C:\Dev\Keypirinha SDK\SDK\cmd\kptmpl.cmd" package $args "C:\Dev\Keypirinha SDK\Extensions"}
New-Alias -Name 'kpplugin' -Value Make-KeypirinhaPlugin

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
