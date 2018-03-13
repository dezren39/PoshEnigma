function Convert-EnigmaMessage {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [String]$message = 'AYYTC IMLGF UUEFW LAOGU TZOXE CRMIM JFMPY QRJDW DKBLO JPCFV UDDSF RPJFA RZOCU BXXMY TAJLC IOMQY ADZUS GYIOC MPFKM HRTFX N',
        [String]$rotor1 = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ',
        [String]$rotor2 = 'AJDKSIRUXBLHWTMCQGZNPYFVOE ',
        [String]$rotor3 = 'BDFHJLCPRTXVZNYEIWGAKMUSQO ',
        [int]$position1 = 10,
        [int]$position2 = 1,
        [int]$position3 = 1,
        [String]$reflector = 'EJMZALYXVBWFCRQUONTSPIKHGD '
    )
    $($(Invoke-EnigmaEngine -message $message `
			    -rotors @( $(Invoke-EnigmaRotor -keymap $rotor1 -position $position1), `
					 	   $(Invoke-EnigmaRotor -keymap $rotor2 -position $position2), `
					 	   $(Invoke-EnigmaRotor -keymap $rotor3 -position $position3)) `
			 	-reflector $(Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ') `
			 	-baseMap   $(Invoke-EnigmaRotor)) -replace "`r","`n")
}