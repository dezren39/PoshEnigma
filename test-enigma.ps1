function decode-enigma {
    [CmdletBinding()]
    param (
        [String]$jar,
        [Parameter(mandatory=$true)]
        [String]$rotor1,
        [Parameter(mandatory=$true)]
        [String]$rotor2,
        [Parameter(mandatory=$true)]
        [String]$rotor3,
        [Parameter(mandatory=$true)]
        [String]$reflector,
        [Parameter(mandatory=$true)]
        [String]$message
    )
    if ($jar -eq $null) {$jar = "$PSScriptRoot/enigma.jar"}
    $temp = "enigma.temp"
    if (Test-Path $temp) {
        $num = -1;
        do {
            $num++
        } while (Test-Path "$temp.$num")
        $temp += ".$num"
    }
    Start-Process `
        -FilePath 'java.exe' `
        -RedirectStandardOutput $temp `
        -ArgumentList "$jar `
            -rotor1 $rotor1 `
            -rotor2 $rotor2 `
            -rotor3 $rotor3 `
            -reflector $reflector `
            -message $message"
    $x = Get-Content $temp
    Remove-Item $temp -Force
    return $x
}