function invoke-enigma {
    [CmdletBinding()]
    param (
        [String]$jar,
        [String]$rotor1 = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ',
        [String]$rotor2 = 'AJDKSIRUXBLHWTMCQGZNPYFVOE ',
        [String]$rotor3 = 'BDFHJLCPRTXVZNYEIWGAKMUSQO ',
        [String]$reflector = 'EJMZALYXVBWFCRQUONTSPIKHGD ',
        [String]$message = 'AYYTC IMLGF UUEFW LAOGU TZOXE CRMIM JFMPY QRJDW DKBLO JPCFV UDDSF RPJFA RZOCU BXXMY TAJLC IOMQY ADZUS GYIOC MPFKM HRTFX N' 
    )
    if ($jar -eq $null) {$jar = "$PSScriptRoot/enigma.jar"}
    $temp = New-TemporaryFile
    Start-Process `
        -FilePath 'java.exe' `
        -RedirectStandardOutput $temp `
        -ArgumentList "$jar `
            -rotor1 $rotor1 `
            -rotor2 $rotor2 `
            -rotor3 $rotor3 `
            -reflector $reflector `
            -message $message" `
        -Wait
    Get-Content $temp
    Remove-Item $temp.FullName -Force
}