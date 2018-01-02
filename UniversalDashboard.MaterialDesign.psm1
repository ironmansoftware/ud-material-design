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

    New-UDElement -Tag "li" -Attributes @{
        href = $Url
        className = "collection-item"
    } -Content $Content
}