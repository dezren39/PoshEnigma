## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Convert-EnigmaMessage' {
    It 'Exists as a Function' {
        Test-Path Function:\Convert-EnigmaMessage | Should -be $true
    }
    It 'Returns a [String]' {
        Convert-EnigmaMessage | Should BeOfType [String]
    }
    It 'Is Commutative' {
    	'HELLO' | Convert-EnigmaMessage | Convert-EnigmaMessage | Should -be 'HELLO'
    }

}