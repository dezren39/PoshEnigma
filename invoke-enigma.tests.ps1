## Ensure the function is available
. .\invoke-enigma.ps1
Describe 'invoke-enigma' {
    It 'Exists as Enigma.jar in script''s root directory' {
        "$PSScriptroot\enigma.jar" | Should Exist
    }
    It 'Should return a [String]' {
        Invoke-Enigma | Should BeOfType [String]
    }
}