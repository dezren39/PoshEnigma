Resolve-Path $PSScriptRoot\*.ps1 |
    ForEach-Object { . $_.ProviderPath }