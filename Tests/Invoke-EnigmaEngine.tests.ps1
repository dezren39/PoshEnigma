## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaEngine' {
    It 'Exists as a Function' {
        Test-Path Function:\Invoke-EnigmaEngine | Should -be $true
    }
    It 'Takes Appropriate Inputs and returns a String.' {
    		"HELLO" |  Invoke-EnigmaEngine `
			     -rotors @( `
			     $(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ '), `
			 $(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE '), `
			 $(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ')) `
			 -reflector $(Invoke-EnigmaRotor) `
			 -baseMap $(Invoke-EnigmaRotor) | Should BeOfType [String] `
    }
    It 'Converts Values Entered' {
    	"HELLO" -eq $("HELLO" |
    		Invoke-EnigmaEngine `
			    -rotors @( `
		    	 	$(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ '), `
			 		$(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE '), `
			 		$(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ')) `
			 	-reflector $(Invoke-EnigmaRotor) `
			 	-baseMap $(Invoke-EnigmaRotor)) | Should -be $false
    }
    It 'Is Commutative' {
    	"HELLO" -eq $($("HELLO" |
    		Invoke-EnigmaEngine `
			    -rotors @( `
		    	 	$(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ '), `
			 		$(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE '), `
			 		$(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ')) `
			 	-reflector $(Invoke-EnigmaRotor) `
			 	-baseMap $(Invoke-EnigmaRotor)) |
	    		Invoke-EnigmaEngine `
				    -rotors @( `
			    	 	$(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ '), `
				 		$(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE '), `
				 		$(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ')) `
				 	-reflector $(Invoke-EnigmaRotor) `
				 	-baseMap $(Invoke-EnigmaRotor)) | Should -be $true
    }
}