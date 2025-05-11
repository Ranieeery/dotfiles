oh-my-posh init pwsh | Invoke-Expression
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/pure.omp.json' | Invoke-Expression
fnm env --use-on-cd | Out-String | Invoke-Expression

## https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/pararussel.omp.json



# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

function gcl {
  param (
    [Parameter(Position = 0)]
    [string]$url,
    
    [Parameter()]
    [switch]$c
  )

  git clone $url
  $dir = Split-Path $url -LeafBase
    
  if ($c) {
    code $dir
  }
  else {
    Set-Location $dir
  }
}

function gcp {
  param (
    [Parameter(Position = 0)]
    [string]$msg,
    
    [Parameter()]
    [switch]$p
  )
  
  git add .
  
  if ([string]::IsNullOrEmpty($msg)) {
    $timestamp = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
    $msg = "autocommit: update with default message at $timestamp"
  }
  
  git commit -m $msg
  
  if ($p) {
    git push
  }
}

function ytd {
  param (
    [Parameter(Mandatory = $true)]
    [string]$url,
    
    [Parameter(Mandatory = $false)]
    [string]$outputDir
  )
  
  if ($outputDir) {
    yt-dlp -f bestvideo+bestaudio/best -N 5 -o "$outputDir/%(title)s.%(ext)s" $url
  }
  else {
    yt-dlp -f bestvideo+bestaudio/best -N 5 $url
  }
}
