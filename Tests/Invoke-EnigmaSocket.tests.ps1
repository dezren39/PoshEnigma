## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaSocket' {
    It 'Exists as a Function' {
        Test-Path Function:\Invoke-EnigmaSocket | Should -be $true
    }

}