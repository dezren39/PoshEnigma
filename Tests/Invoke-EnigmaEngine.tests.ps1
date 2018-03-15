## Ensure the function is available
Import-Module "$PSScriptRoot\..\PoshEnigmaMachine\PoshEnigmaMachine.psm1" -Force
Describe 'Invoke-EnigmaEngine' {
    It 'Exists as a function' {
		Test-Path Function:\Invoke-EnigmaEngine |
			Should -be $true
    }
    It 'Takes appropriate inputs and returns a [String]' {
			"HELLO" |
				Invoke-EnigmaEngine `
				-rotors `
					@(
						$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' ),
						$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' ),
						$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' )
					) `
				-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
				-baseMap $( Invoke-EnigmaRotor ) |
					Should BeOfType [String] `
    }
    It 'Converts values entered' {
    	"HELLO" -eq $(
				"HELLO" |
					Invoke-EnigmaEngine `
					-rotors `
						@(
							$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' ),
							$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' ),
							$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' )
						) `
					-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
					-baseMap $( Invoke-EnigmaRotor )
			) |
				Should -be $false
    }
    It 'Is commutative ("HELLO WORLD")' {
    	$(
			$(
				"HELLO WORLD" |
					Invoke-EnigmaEngine `
					-rotors `
						@(
							$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
							$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
							$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )
						) `
					-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
					-baseMap $( Invoke-EnigmaRotor )
			) |
    			Invoke-EnigmaEngine `
				-rotors `
					@(
						$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
						$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
						$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )
					) `
			 	-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
				-baseMap $( Invoke-EnigmaRotor )
		) |
			Should -be 'HELLO WORLD'
	}
	It 'Is commutative (1024 Of 1 character, full charset tested)' {
		" $([char[]](65..90) -join '')".ToCharArray() |
			ForEach-Object {
				$x = "$_" * 1024
				$(
					$(
						$x |
						Invoke-EnigmaEngine `
						-rotors `
							@(
								$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
								$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
								$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )
							) `
						-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
						-baseMap $( Invoke-EnigmaRotor )
					) |
						Invoke-EnigmaEngine `
						-rotors `
							@(
								$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
								$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
								$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )
							) `
						-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
						-baseMap $( Invoke-EnigmaRotor )
				) -eq $x |
					Should -be $true
			}
	}
	# Example of how I might the next test for my own reading.
	# It 'Is commutative (30x1024 random characters)' {
	# 	[Object]$Random = New-Object  System.Random
	# 	1..30 | % { $x = "$($(1..1024 | % {
	# 					$i = $Random.Next(65,92)
	# 					[char[]]($(if ($i -eq 91) {32} else {$i}))})-join '')"
	# 			$($($x  | Invoke-EnigmaEngine -rotors @($( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
	# 													$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
	# 													$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )) `
	# 											-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
	# 											-baseMap $( Invoke-EnigmaRotor )) |
	# 					Invoke-EnigmaEngine -rotors @( $( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
	# 													$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
	# 													$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )) `
	# 										-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
	# 										-baseMap $( Invoke-EnigmaRotor )) -eq $x | Should -be $true }
	# }
	It 'Is commutative (30x1024 random characters)' {
		[Object]$Random = New-Object  System.Random
		1..30 | 
			ForEach-Object { 
				$x = $null
				1..1024 | 
					ForEach-Object {
						$i = $Random.Next(65,92)
						$x += [char[]](
							$(
								if ($i -eq 91) { 
									32 
								} else { 
									$i 
								}
							)
						)
					}
				$x = $x -join ''
				$(
					$(
						"$x" |
						Invoke-EnigmaEngine `
						-rotors `
							@(
								$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
								$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
								$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )
							) `
						-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
						-baseMap $( Invoke-EnigmaRotor )
					) |
						Invoke-EnigmaEngine `
						-rotors `
							@(
								$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 10 ),
								$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 1 ),
								$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 1 )
							) `
						-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
						-baseMap $( Invoke-EnigmaRotor )
				) -eq "$x" |
					Should -be $true
			}
	}
    It 'Outputs N of 1 key code with input of N of 1 key code and all positions set to 0' {
    	$g = "GGGGGGGGGGGG" |
    		Invoke-EnigmaEngine `
				-rotors `
					@(
						$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 0 ),
						$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 0 ),
						$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 0 )
					) `
			 	-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' -position 0 ) `
			 	-baseMap $( Invoke-EnigmaRotor -position 0 )
		$g.length -eq $g.split( $g[ 0 ] ).count - 1 |
			Should -be $true
    }
    It 'Outputs < N of 1 key code with input of N of 1 key code and all positions set to 5' {
    	$g = "GGGGGGGGGGGG" |
    		Invoke-EnigmaEngine `
				-rotors `
					@(
						$( Invoke-EnigmaRotor -keymap 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ' -position 5 ),
						$( Invoke-EnigmaRotor -keymap 'AJDKSIRUXBLHWTMCQGZNPYFVOE ' -position 5 ),
						$( Invoke-EnigmaRotor -keymap 'BDFHJLCPRTXVZNYEIWGAKMUSQO ' -position 5 )
					) `
			 	-reflector $( Invoke-EnigmaRotor -keymap 'EJMZALYXVBWFCRQUONTSPIKHGD ' ) `
			 	-baseMap $( Invoke-EnigmaRotor)
		$g.length -eq $g.split( $g[ 0 ] ).count - 1 |
			Should -be $false
    }
}