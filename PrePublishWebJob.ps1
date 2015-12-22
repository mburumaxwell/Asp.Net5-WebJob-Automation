param($websiteOutput, $webJobOutput, $webJobName)

$source = "$webJobOutput\approot"
$destination = "$websiteOutput\wwwroot\App_Data\jobs\continuous\$webJobName"

Write-Host("Copying files from '$source' to '$destination'")
Copy-Item $source -Destination $destination -Force -Recurse

Write-Host("Deleting files from '$source'")
Remove-Item $source -Recurse

Write-Host("Done preparing webjob for publish!")