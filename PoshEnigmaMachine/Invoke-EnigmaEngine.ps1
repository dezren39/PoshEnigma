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
    $( $message.ToCharArray() | % {
    	if ( $firstRunComplete ) {
    		[array]::reverse( $rotors )
    	}
    	$char = $_
    	$rotors | % {
    		if ( $firstRunComplete -and $_.Position -ne 0 ) {
				$currentPosition = [Math]::Truncate( $counter % $_.Position )
				if ( $basemap.Keys.IndexOf( $char ) - $currentPosition -lt 0 ) {
					$currentPosition = $basemap.Keys.IndexOf( $char ) + ($basemap.Keys.length - $currentPosition)
				} else {
					$currentPosition = $basemap.Keys.IndexOf( $char ) - $currentPosition
				}
			} else { $currentPosition = $basemap.Keys.IndexOf( $char ) }
    		$char = $_.Keys[ $currentPosition ]
    	}
    	$char = $reflector.Keys[ $basemap.Keys.IndexOf( $char ) ]
    	[array]::reverse( $rotors )
    	$rotors | % {
    		if ( $firstRunComplete -and $_.Position -ne 0 ) {
				$currentPosition = [Math]::Truncate( $counter % $_.Position )
				if ( $_.Keys.IndexOf( $char ) + $currentPosition -ge $basemap.Keys.length) {
					$currentPosition = ($_.Keys.IndexOf( $char ) - $basemap.Keys.length) + $currentPosition
				} else {
					$currentPosition = $_.Keys.IndexOf( $char ) + $currentPosition
				}
			} else { $currentPosition = $_.Keys.IndexOf( $char ) }
    		$char = $basemap.Keys[ $currentPosition ]
    	}
    	$counter += 1
    	if ( !$firstRunComplete ) { $firstRunComplete = $true }
    	$char
    }) -join ''
}