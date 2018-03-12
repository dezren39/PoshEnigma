function Invoke-EnigmaEngine {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [string]$message,
        [array]$rotors,
        $reflector,
        $baseMap
    )
    $firstRunComplete = $false
    $($message.ToCharArray() | % {
    	if ($firstRunComplete) {
    		[array]::reverse($rotors)
    	} else { $firstRunComplete = $true }
    	$char = $_
    	$rotors | % {
    		$char = $_.Keys[$basemap.Keys.IndexOf($char)]
    	}
    	$char = $reflector.Keys[$basemap.Keys.IndexOf($char)]
    	[array]::reverse($rotors)
    	$rotors | % {
    		$char = $basemap.Keys[$_.Keys.IndexOf($char)]
    	}
    	$char
    }) -join ''
}