$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\manpass.exe"
}

if (Test-Path $packageArgs['file']) {
  Install-BinFile -Name "manpass" -Path $packageArgs['file']
} else {
  Write-Error "File manpass.exe not found in $toolsDir"
}