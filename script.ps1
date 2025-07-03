param (
  [string]$o = "output.txt",
  [string]$b = "",
  [Parameter(ValueFromRemainingArguments = $true)]
  [string[]]$RemainingArgs
)

$RootDirectory = if ($RemainingArgs.Length -ge 1) {
  Resolve-Path -LiteralPath $RemainingArgs[0] | Select-Object -ExpandProperty Path
} else {
  Get-Location | Select-Object -ExpandProperty Path
}

$OutputFile = $o
$BlacklistFile = $b
$OutputPath = Join-Path $RootDirectory $OutputFile
$Blacklist = @()

if ($BlacklistFile -ne "") {
  $Blacklist = Get-Content $BlacklistFile | Where-Object { $_ -and ($_ -notmatch "^\s*#") } | ForEach-Object { $_.Trim().TrimEnd('\','/') }
}

"" | Out-File -FilePath $OutputPath -Encoding UTF8

$AllFiles = Get-ChildItem -Path $RootDirectory -Recurse -File | Where-Object { $_.FullName -ne $OutputPath }

foreach ($file in $AllFiles) {
  $relativePath = $file.FullName.Substring($RootDirectory.Length + 1).Replace("\", "/")
  $exclude = $false

  foreach ($pattern in $Blacklist) {
    if ($file.FullName -like "*\$pattern*") {
      $exclude = $true
      break
    }
  }

  if (-not $exclude) {
    Add-Content -Path $OutputPath -Value "File: $relativePath"
    Add-Content -Path $OutputPath -Value ""
    Get-Content $file.FullName | Add-Content -Path $OutputPath
    Add-Content -Path $OutputPath -Value ""
  }
}

Write-Host "Generated file: $OutputPath"
