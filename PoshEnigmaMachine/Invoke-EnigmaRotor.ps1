function Invoke-EnigmaRotor {
    [CmdletBinding()]
    param (
        [parameter(ValueFromPipeline)]
        [String]$keymap = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ',
        [int] $position = 0
    )
    @{keys = $keymap; position = $position;}
}