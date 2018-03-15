function Invoke-EnigmaEngine {
  [CmdletBinding()]
  	param (
	  [parameter( ValueFromPipeline )]
        [string] $message,
        [array] $rotors,
        $reflector,
		$baseMap
	)
    $counter = -1
	$(
		$message.ToCharArray() |
			ForEach-Object {
				$counter = $counter + 1
				$char = $_
				$rotors |
					ForEach-Object {
						if ($_.Position -ne 0 ) {
							$currentPosition = $basemap.Keys.IndexOf( $char ) +
								[Math]::Truncate( $counter / $_.Position )
							if ( $currentPosition -ge $basemap.Keys.length) {
								$currentPosition = $currentPosition -
									(
										[Math]::Truncate( $currentPosition / $basemap.Keys.length ) *
											$basemap.Keys.length
									)
							}
						} else {
							$currentPosition = $basemap.Keys.IndexOf( $char )
						}
						$char = $_.Keys[ $currentPosition ]
					}
				$char = $reflector.Keys[ $basemap.Keys.IndexOf( $char ) ]
				[array]::reverse( $rotors )
				$rotors |
					ForEach-Object {
						if ($_.Position -ne 0 ) {
							$currentPosition = $_.Keys.IndexOf( $char ) -
								[Math]::Truncate( $counter / $_.Position )
							if ( $currentPosition -lt 0) {
								$currentPosition = $currentPosition - `
										(
											[Math]::Truncate( $currentPosition / $basemap.Keys.length) *
												$basemap.Keys.length
										)
							}
						} else {
							$currentPosition = $_.Keys.IndexOf( $char )
						}
						$char = $basemap.Keys[ $currentPosition ]
					}
				[array]::reverse( $rotors )
				$char
			}
	) -join ''
}