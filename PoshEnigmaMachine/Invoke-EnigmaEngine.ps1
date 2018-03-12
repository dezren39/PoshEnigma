function Invoke-EnigmaEngine {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [string]$message,
        [array]$rotors,
        [HashMap]$reflector,
        [string]$baseMap
    )
}