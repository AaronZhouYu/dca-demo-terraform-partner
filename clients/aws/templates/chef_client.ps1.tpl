$ChefClientURL         = "https://packages.chef.io/files/stable/chef/${windows_chef_client_version}/windows/${windows_version}/chef-client-${windows_chef_client_version}-1-x64.msi"
$ChefServerURL         = "https://${automate_hostname}/organizations/${demo_org_name}"
$ValidatorName         = "${demo_org_name}-validator"
$ChefRootDir           = "c:\chef"
$ChefClientInstallFile = "chef-client.msi"
$ChefClientRBFile      = "client.rb"
$ChefFirstBootFile     = "first-boot.json"

Write-Host "(Host) Unattended Chef Infra Client Install"
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

## Download the Chef Client
(New-Object System.Net.WebClient).DownloadFile($ChefClientURL,"$ChefRootDir\$ChefClientInstallFile")

## Install the Chef Client
Start-Process msiexec.exe -ArgumentList @('/qn', '/lv c:\chef\install.log', '/i c:\chef\chef-client.msi', 'ADDLOCAL="ChefClientFeature,ChefSchTaskFeature,ChefPSModuleFeature"') -Wait

## Create first-boot.json
function Create-FirstBootFile {
    ## write-output "{`"run_list`": `[`]}" | Out-File -FilePath $ChefRootDir\$ChefFirstBootFile -Encoding ascii
    $firstboot = @{
        policy_group = '${policy_group}'
        policy_name = '${policy_name}'
    }
    Set-Content -Path $ChefRootDir\$ChefFirstBootFile -Value ($firstboot | ConvertTo-Json -Depth 10)
}

## Create client.rb
function Create-ClientRBFile {
    write-output "log_level              :info" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii
    write-output "log_location           STDOUT" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii -Append
    write-output "chef_server_url        '$ChefServerURL'" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii -Append
    write-output "validation_client_name '$ValidatorName'" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii -Append
    write-output "validation_key         '$ChefRootDir\$ValidatorName.pem'" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii -Append
    write-output "node_name              '${tags_name}'" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii -Append
    write-output "ssl_verify_mode        :verify_none" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii -Append
    write-output "chef_license           'accept'" | Out-File -FilePath $ChefRootDir\$ChefClientRBFile -Encoding ascii -Append
}

if (Test-Path -Path "$ChefRootDir\$ChefClientRBFile") {
    ## File already exists so let's overwrite it with the new params
    Create-ClientRBFile
}
else{
    ## Something doesn't exist so we need to make the things
    if (Test-Path -Path "$ChefRootDir") {
        #Folder is there so all we need to do is make the file
        Out-File -FilePath "$ChefRootDir\$ChefClientRBFile" -Encoding ascii
    }
    else {
        ## Nothing exists so make all the things
        New-Item -Path "$ChefRootDir" -ItemType Directory
        Out-File -FilePath "$ChefRootDir\$ChefClientRBFile" -Encoding ascii
    }
    ## Now that the file exists, populate it!
    Create-ClientRBFile
}

if (Test-Path -Path "$ChefRootDir\$ChefFirstBootFile") {
    ## File already exists so let's overwrite it with the new params
    Create-FirstBootFile
}
else {
    ## Something doesn't exist so we need to make the things
    if (Test-Path -Path "$ChefRootDir") {
        #Folder is there so all we need to do is make the file
        Out-File -FilePath "$ChefRootDir\$ChefFirstBootFile" -Encoding ascii
    }
    else {
        ## Nothing exists so make all the things
        New-Item -Path "$ChefRootDir" -ItemType Directory
        Out-File -FilePath "$ChefRootDir\$ChefFirstBootFile" -Encoding ascii
    }
    ## Now that the file exists, populate it!
    Create-FirstBootFile
}

## Run Chef
cmd /c "c:\opscode\chef\bin\chef-client.bat -j c:\chef\first-boot.json"