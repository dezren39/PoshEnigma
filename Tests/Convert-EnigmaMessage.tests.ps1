## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Convert-EnigmaMessage' {
    It 'Exists as a function' {
        Test-Path Function:\Convert-EnigmaMessage |
            Should -be $true
    }
    It 'Returns a [String]' {
        Convert-EnigmaMessage |
            Should BeOfType [String]
    }
    It 'Is commutative ("HELLO WORLD")' {
        'HELLO WORLD' |
            Convert-EnigmaMessage |
                Convert-EnigmaMessage |
                    Should -be 'HELLO WORLD'
    }
    It 'Is commutative (self)' {
            $(
                Convert-EnigmaMessage |
                    Convert-EnigmaMessage |
                        Convert-EnigmaMessage
            ) -eq $(Convert-EnigmaMessage) |
                        Should -be $true
    }
}