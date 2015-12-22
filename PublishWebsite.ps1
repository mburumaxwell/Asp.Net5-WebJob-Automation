param($websiteName, $packOutput)

$website = Get-AzureWebsite -Name $websiteName

# get the scm url to use with MSDeploy.  By default this will be the second in the array
$msdeployurl = ($website.EnabledHostNames | Where-Object {$_.Contains(".scm")})


$publishProperties = @{'WebPublishMethod'='MSDeploy';
                        'MSDeployServiceUrl'=$msdeployurl;
                        'DeployIisAppPath'=$website.Name;
						'SkipExtraFilesOnServer'='False';
						'CompileSource'='True';
                        'Username'=$website.PublishingUsername;
                        'Password'=$website.PublishingPassword}


$publishScript = "${env:ProgramFiles(x86)}\Microsoft Visual Studio 14.0\Common7\IDE\Extensions\Microsoft\Web Tools\Publish\Scripts\default-publish.ps1"


. $publishScript -publishProperties $publishProperties  -packOutput $packOutput