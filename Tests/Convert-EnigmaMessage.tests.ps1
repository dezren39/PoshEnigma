## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Convert-EnigmaMessage' {
    It 'Exists as a function' {
        Test-Path Function:\Convert-EnigmaMessage | Should -be $true
    }
    It 'Should return a [String]' {
        Convert-EnigmaMessage | Should BeOfType [String]
    }
}