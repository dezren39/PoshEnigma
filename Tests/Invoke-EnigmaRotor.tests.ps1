## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaRotor' {
    It 'Exists as a Function' {
        Test-Path Function:\Invoke-EnigmaRotor | Should -be $true
    }
    It 'Returns an EnigmaRotor HashMap' {
    	$x = Invoke-EnigmaRotor -position 10
    	$x.Keys.Length | Should -be 27
    	$x.Position | Should -be 10
    }
}