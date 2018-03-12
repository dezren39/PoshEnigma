## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaEngine' {
    It 'Exists as a Function' {
        Test-Path Function:\Invoke-EnigmaEngine | Should -be $true
    }
    It 'Takes Appropriate Inputs and returns a String.' {
    	"Hello" |
    		Invoke-EnigmaEngine
    			-rotors @(
    				$(Invoke-EnigmaRotor),
					$(Invoke-EnigmaRotor),
					$(Invoke-EnigmaRotor)
					)
				-reflector Invoke-EnigmaRotor | Should BeOfType [String]
    }
}