function Invoke-EnigmaRotor {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [String]$keymap = 'EKMFLGDQVZNTOWYHXUSPAIBRCJ ',
        [int] $position = 10,
        [int] $currentPosition = 0
    )
    @{keys = $keymap.ToCharArray(); position = $position; currentPosition = $currentPosition}
}