function Invoke-EnigmaEngine {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [string]$message,
        [array]$rotors,
        $reflector,
        $baseMap
    )
    return $message | % {
    	$char = $_
    	$rotors | % {
    		$char = $_.keys[[array]::indexof($baseMap.keys, $char)]
    	}
    	$char = $reflector.keys[[array]::indexof($baseMap.keys, $char)]
    	[array]::reverse($rotors) | % {
    		$char = $_.keys[[array]::indexof($baseMap.keys, $char)]
    	}
    	$char
    }
}