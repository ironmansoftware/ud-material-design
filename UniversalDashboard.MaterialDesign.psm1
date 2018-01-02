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

function New-UDChip {
    param(
       $Image,
       $Text,
       [Switch]$CloseButton,
       $Margin = 20
    )

    $Content = @()

    if ($Image -ne $null) {
        $Content += New-UDElement -Tag "img" -Attributes @{
            src = $Image
        }
    }

    $Content += $Text

    if ($CloseButton) {
        $Content += New-UDElement -Tag "i" -Attributes @{
            className = "close fa fa-times"
        }
    }

    New-UDElement -Tag "div" -Attributes @{
        className = "chip"
        style = @{
            margin = "$($Margin)px"
        }
    } -Content {
        $Content
    }
}