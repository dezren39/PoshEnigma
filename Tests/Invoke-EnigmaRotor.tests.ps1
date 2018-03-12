## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaRotor' {
    It 'Exists as a Function' {
        Test-Path Function:\Invoke-EnigmaRotor | Should -be $true
    }
}