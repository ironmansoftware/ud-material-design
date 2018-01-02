function New-UDCollection {
    param(
        $Content
    )

    New-UDElement -Tag "ul" -Attributes @{
        className = "collection"
    } -Content $Content
}

function New-UDCollectionItem {
    param(
        $Content,
        $Url,
        [Switch]$Active
    )

    $className = "collection-item"
    if ($Active) {
        $className += " active"
    }

    if ($Url -ne $null) {
        New-UDElement -Tag "a" -Attributes @{
            href = $Url
            className = $className
        } -Content $Content
    } else {
        New-UDElement -Tag "li" -Attributes @{
            href = $Url
            className = $className
        } -Content $Content
    }


}