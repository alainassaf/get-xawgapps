<#
.SYNOPSIS
Lists active published applications from a designated XA 6.5 Worker Group
.DESCRIPTION
Lists active published applications from a designated XA 6.5 Worker Group
.PARAMETER XMLBroker
XML Broker to query. Can be a comma separated list.
.PARAMETER WorkerGroup
WorkerGroup to query for published applications.
.EXAMPLE
PS C:\> get-xawgapps.ps1 -XMLBROKER BROKER -WORKERGROUP 'FINANCE APPS'
Queries the BROKER and retrieves list of active published applications from 'FINANCE APPS'
.NOTES
NAME        :  get-xawgapps
VERSION     :  1.01
CHANGE LOG - Version - When - What - Who
1.00 - 03/10/2017 - Initial script - Alain Assaf
1.01 - 03/10/2017 - Simplyfied script to just one line doing all the work - Alain Assaf
LAST UPDATED:  03/10/2017
AUTHOR      :  Alain Assaf
.LINK
http://www.linkedin.com/in/alainassaf/
http://wagthereal.com
.INPUTS
None
.OUTPUTS
None
#>
Param(
    [parameter(Position = 0, Mandatory=$True )] 	
    [ValidateNotNullOrEmpty()]
    $WorkerGroup,

    [parameter(Position = 1, Mandatory=$False )]
    [ValidateNotNullOrEmpty()]
    $XMLBroker="YOURDC.DOMAIN.LOCAL" # Change to hardcode a default value for your Delivery Controllers
)

### START FUNCTION: get-xmlbroker #############################################
Function Get-xmlbroker { 
<#
    .SYNOPSIS
    Gets responsive Citrix.
    .DESCRIPTION
    Gets responsive Citrix.
    .PARAMETER XMLBrokers
    Required parameter. Server to use as an XML Broker. Can be a list separated by commas.
    .INPUTS
    None
    .OUTPUTS
    None
    .EXAMPLE
    PS> Get-xmlbroker SERVERNAME
    Query SERVERNAME to see if it responsive. Assumes that SERVERNAME is a Citrix XML Broker
    .LINK
    http://www.linkedin.com/in/alainassaf/
    http://wagthereal.com
    .NOTES
    NAME        :  Get-xmlbroker
    VERSION     :  1.00
    CHANGE LOG - Version - When - What - Who
    1.00 - 03/08/2017 - Initial script - Alain Assaf
    LAST UPDATED:  03/08/2017
    AUTHOR      :  Alain Assaf
#>
    [CmdletBinding()] 
    param ([parameter(Position = 0, Mandatory=$False)]
           [ValidateNotNullOrEmpty()]
           $XMLBrokers
    )
            
    $DC = $XMLBrokers.Split(",")
    foreach ($broker in $DC) {
        if ((Test-Port $broker) -and (Test-Port $broker -port 1494) -and (Test-Port $broker -port 2598))  {
            $XMLBroker = $broker
            break
        }
    }
    Return $XMLBroker
}
### END FUNCTION: get-xmlbroker ###############################################

$wgapps =@()

#Get working XML Broker
$broker = Get-xmlbroker $XMLBroker #Function from Module: ctxModules

#Get list of pub apps associated with Workergroup
Get-XAApplication -ComputerName $broker -WorkerGroupName $WorkerGroup | where {$_.Enabled -eq $true} | select browsername | sort browsername