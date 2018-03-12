function Invoke-EnigmaRotor {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [String]$keymap = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ',
        [int] $position = 0,
        [int] $currentPosition = 0,
        [int] $counter = 0
    )
    @{keys = $keymap.ToCharArray(); position = $position; currentPosition = $currentPosition; counter = $counter}
}