function Invoke-EnigmaEngine {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [string]$message,
        [array]$rotors,
        $reflector,
        $baseMap
    )
    return $($message.ToCharArray() | % {
    	$char = $_
    	# $rotors | % {
    		$char = $rotors[0].Keys[$basemap.Keys.IndexOf($char)]

    	# $char = $reflector.Keys[$basemap.Keys.IndexOf($char)]
    	# # [array]::reverse($rotors) | % {
    	# 	$char = $rotors[0].Keys[$basemap.Keys.IndexOf($char)]
    	# # }
    	# 1
    	$char
    	# 2
    	# $rotors
    	# 3
    	# $rotors[0]
    	# 4
    	# $basemap
    }) -join ''
}