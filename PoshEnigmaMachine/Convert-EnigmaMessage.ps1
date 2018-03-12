function Convert-EnigmaMessage {
    [CmdletBinding()]
    param (
        [String]$rotor1 = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ',
        [String]$rotor2 = 'AJDKSIRUXBLHWTMCQGZNPYFVOE ',
        [String]$rotor3 = 'BDFHJLCPRTXVZNYEIWGAKMUSQO ',
        [String]$reflector = 'EJMZALYXVBWFCRQUONTSPIKHGD ',
        [parameter(ValueFromPipeline)]
        [String]$message = 'AYYTC IMLGF UUEFW LAOGU TZOXE CRMIM JFMPY QRJDW DKBLO JPCFV UDDSF RPJFA RZOCU BXXMY TAJLC IOMQY ADZUS GYIOC MPFKM HRTFX N'
    )
    $message
}