## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaEngine' {
    It 'Exists as a Function' {
        Test-Path Function:\Invoke-EnigmaEngine | Should -be $true
    }

}