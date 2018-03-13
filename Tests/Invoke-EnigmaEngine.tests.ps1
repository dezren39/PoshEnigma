## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaEngine' {
    It 'Exists as a Function' {
        Test-Path Function:\Invoke-EnigmaEngine | Should -be $true
    }
    It 'Takes Appropriate Inputs and returns a String.' {
    		"HELLO" | Invoke-EnigmaEngine `
			     -rotors @( `
			     $(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ '), `
			 $(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE '), `
			 $(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ')) `
			 -reflector $(Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ') `
			 -baseMap $(Invoke-EnigmaRotor) | Should BeOfType [String] `
    }
    It 'Converts Values Entered' {
    	"HELLO" -eq $("HELLO" |
    		Invoke-EnigmaEngine `
			    -rotors @( `
		    	 	$(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ '), `
			 		$(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE '), `
			 		$(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ')) `
			 	-reflector $(Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ') `
			 	-baseMap $(Invoke-EnigmaRotor)) | Should -be $false
    }
    It 'Is Commutative' {
    	$($("HELLO" |
    		Invoke-EnigmaEngine `
			    -rotors @( `
		    	 	$(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10), `
			 		$(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1), `
			 		$(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1)) `
			 	-reflector $(Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ') `
			 	-baseMap $(Invoke-EnigmaRotor)) |
    		Invoke-EnigmaEngine `
			    -rotors @( `
		    	 	$(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10), `
			 		$(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1), `
			 		$(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1)) `
			 	-reflector $(Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ') `
			 	-baseMap $(Invoke-EnigmaRotor)) | Should -be 'HELLO'
    }
    It 'Outputs N of 1 key code with input of N of 1 key code and all positions set to 0' {
    	$g = "GGGGGGGGGGGG" |
    		Invoke-EnigmaEngine `
			    -rotors @( `
		    	 	$(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 0), `
			 		$(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 0), `
			 		$(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 0)) `
			 	-reflector $(Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' -position 0) `
			 	-baseMap $(Invoke-EnigmaRotor -position 0)
		$g.length -eq $g.split($g[0]).count - 1 | Should -be $true
    }
    It 'Outputs < N of 1 key code with input of N of 1 key code and all positions set to 5' {
    	$g = "GGGGGGGGGGGG" |
    		Invoke-EnigmaEngine `
			    -rotors @( $(Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 5), `
					 	   $(Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 5), `
					 	   $(Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 5)) `
			 	-reflector $(Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ') `
			 	-baseMap   $(Invoke-EnigmaRotor -position 0)
		$g.length -eq $g.split($g[0]).count - 1 | Should -be $false
    }
}