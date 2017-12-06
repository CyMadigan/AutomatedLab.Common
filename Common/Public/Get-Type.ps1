function Get-Type
{
    # .ExternalHelp AutomatedLab.Help.xml
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string] $GenericType,
        
        [Parameter(Position = 1, Mandatory = $true)]
        [string[]] $T
    )
    
    $T = $T -as [type[]]
    
    try
    {
        $generic = [type]($GenericType + '`' + $T.Count)
        $generic.MakeGenericType($T)
    }
    catch [Exception]
    {
        throw New-Object -TypeName System.Exception -ArgumentList ('Cannot create generic type', $_.Exception)
    }
}
