function Invoke-EnigmaEngine {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [string]$message,
        [array]$rotors,
        $reflector,
        [string]$baseMap = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ '
    )
    $message | % {
    	$char = $_
    	$rotors | % {

    	}
    }
}