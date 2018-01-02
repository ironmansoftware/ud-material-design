# Material Design components for PowerShell Universal Dashboard

Install from the [PowerShell Gallery](https://www.powershellgallery.com/packages/UniversalDashboard.MaterialDesign)

```
Install-Module UniversalDashboard.MaterialDesign
```

To learn more about Universal Dashboard, visit [PoshUd.com](https://www.poshud.com)

## Material Design Components 

### Collections 

```
 New-UDCollection -Content {
    New-UDCollectionItem -Content { "Poshud" } -Active -Url "http://www.poshud.com"
    New-UDCollectionItem -Content { "PoshTools" } -Url "http://www.poshtools.com"
    New-UDCollectionItem -Content { "GitBook" } -Url "http://www.gitbook.com"
    New-UDCollectionItem -Content { "GitHub" } -Url "http://www.github.com"
}
```


![Image of collections](/images/collection.PNG)
