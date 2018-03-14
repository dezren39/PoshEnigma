function Invoke-EnigmaEngine {
  [CmdletBinding()]
  	param (
	  [parameter( ValueFromPipeline )]
        [string] $message,
        [array] $rotors,
        $reflector,
		$baseMap
	)
    $firstRunComplete = $false
    $counter = 0
	$(
		$message.ToCharArray() |
			ForEach-Object {
				if ( $firstRunComplete ) {
					[array]::reverse( $rotors )
					$counter = $counter + 1
				}
				$char = $_
				$rotors |
					ForEach-Object {
						if ($_.Position -ne 0 ) {
							$currentPosition = $basemap.Keys.IndexOf( $char ) -
								[Math]::Truncate( $counter / $_.Position )
							if ( $currentPosition -lt -$basemap.Keys.length) {
								$currentPosition = $currentPosition - `
										(
											[Math]::Truncate( $currentPosition / $basemap.Keys.length) - 1
										) * $basemap.Keys.length
							}
						} else {
							$currentPosition = $basemap.Keys.IndexOf( $char )
						}
						$char = $_.Keys[ $currentPosition ]
					}
				$char = $basemap.Keys[ $reflector.Keys.IndexOf( $char ) ]
				[array]::reverse( $rotors )
				$rotors |
					ForEach-Object {
						if ($_.Position -ne 0 ) {
							$currentPosition = $_.Keys.IndexOf( $char ) +
								[Math]::Truncate( $counter / $_.Position )
							if ( $currentPosition -ge $basemap.Keys.length) {
								$currentPosition = $currentPosition -
									(
										[Math]::Truncate( $currentPosition / $basemap.Keys.length ) *
										$basemap.Keys.length
									)
							}
						} else {
							$currentPosition = $_.Keys.IndexOf( $char )
						}
						$char = $basemap.Keys[ $currentPosition ]
					}
				if ( !$firstRunComplete ) {
					$firstRunComplete = $true
				}
				$char
			}
	) -join ''
}