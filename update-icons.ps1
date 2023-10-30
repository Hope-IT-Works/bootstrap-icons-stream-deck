$TWBS_ICONS_REPO = "https://api.github.com/repos/twbs/icons/releases/latest"

Write-Host "Clearing existing data..."

if(Test-Path -Path "twbs-icons.zip"){
    Remove-Item -Path "twbs-icons.zip"
}

if(Test-Path -Path "twbs-icons\*"){
    Remove-Item -Path "twbs-icons\*" -Recurse
}

if(Test-Path -Path "com.hope-it-works.bootstrap.sdIconPack\icons\*"){
    Remove-Item -Path "com.hope-it-works.bootstrap.sdIconPack\icons\*" -Recurse
}

function Invoke-Fatal($Message) {
    Write-Error ("Error: " + $message)
    exit
}

try {
    Write-Host "Requesting icon pack from GitHub..."
    $TWBS_ICONS_REQ = Invoke-WebRequest -UseBasicParsing -Uri $TWBS_ICONS_REPO
} catch {
    Invoke-Fatal -Message "GitHub API Request failed."
}

try {
    $TWBS_ICONS_RES = $TWBS_ICONS_REQ.Content | ConvertFrom-Json
    $TWBS_ICONS_ASSETS = $TWBS_ICONS_RES.Assets
} catch {
    Invoke-Fatal -Message "GitHub API returned invalid JSON."
}

try {
    Write-Host "Downloading icon pack from GitHub..."
    Invoke-WebRequest -UseBasicParsing -Uri $TWBS_ICONS_ASSETS[0].browser_download_url -OutFile "twbs-icons.zip"
} catch {
    Invoke-Fatal -Message "Downloading icons failed."
}

if(Test-Path -Path "twbs-icons.zip"){
    try {
        Write-Host "Expanding icon pack..."
        Expand-Archive -Path "twbs-icons.zip" -DestinationPath "twbs-icons"
    } catch {
        Invoke-Fatal -Message "zip-File could not be expanded."
    }
} else {
    Invoke-Fatal -Message "zip-File does not exist."
}

$TWBS_ICONS_DIRS = Get-ChildItem -Path ".\twbs-icons"

if($TWBS_ICONS_DIRS.Count -gt 0){
    Write-Host "Deploying icons to icon pack..."
    Move-Item -Path ("twbs-icons\"+$TWBS_ICONS_DIRS[0].BaseName+"\*.svg") -Destination ".\com.hope-it-works.bootstrap.sdIconPack\icons" -Force
} else {
    Invoke-Fatal -Message "Expanded archive is empty."
}

$TWBS_ICONS_DICTIONARY = New-Object -TypeName System.Collections.ArrayList

Get-ChildItem -Path ".\com.hope-it-works.bootstrap.sdIconPack\icons" | ForEach-Object {
    $ICON_OBJECT = New-Object -TypeName PSCustomObject
    $ICON_OBJECT | Add-Member -MemberType NoteProperty -Name "path" -Value $_.Name
    $ICON_OBJECT | Add-Member -MemberType NoteProperty -Name "name" -Value $_.BaseName
    $ICON_OBJECT | Add-Member -MemberType NoteProperty -Name "tags" -Value $_.BaseName.Split("-")
    Set-Content -Path $_.FullName -Encoding utf8 -Value ((Get-Content -Path $_.FullName -Encoding utf8) -replace "currentColor","#ffffff")
    $TWBS_ICONS_DICTIONARY.Add($ICON_OBJECT) | Out-Null
    Write-Host ("Added "+$_.BaseName)
}

Write-Host "Generating icons dictionary..."
Set-Content -Path ".\com.hope-it-works.bootstrap.sdIconPack\icons.json" -Value ($TWBS_ICONS_DICTIONARY | ConvertTo-Json) -Encoding utf8

Write-Host "Deleting temporary files..."
if(Test-Path -Path "twbs-icons.zip"){
    Remove-Item -Path "twbs-icons.zip"
}

if(Test-Path -Path "twbs-icons\*"){
    Remove-Item -Path "twbs-icons\*" -Recurse
}

Write-Host "Finished!"