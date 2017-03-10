# get-xawgapps
Lists active published applications from a designated XA 6.5 Worker Group

# PS> get-help .\get-xawgapps.ps1 -full

NAME<br>
    get-xawgapps.ps1
    
SYNOPSIS<br>
    Lists active published applications from a designated XA 6.5 Worker Group
    
SYNTAX<br>
    get-xawgapps.ps1 [-WorkerGroup] <Object> [[-XMLBroker] <Object>] [<CommonParameters>]
    
    
DESCRIPTION<br>
    Lists active published applications from a designated XA 6.5 Worker Group
    

PARAMETERS<br>
    
    -WorkerGroup <Object>
        WorkerGroup to query for published applications.
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -XMLBroker <Object>
        XML Broker to query. Can be a comma separated list.
        
        Required?                    false
        Position?                    2
        Default value                YOURDC.DOMAIN.LOCAL
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS<br>
    None
    
OUTPUTS<br>
    None
    
NOTES

        NAME:  get-xawgapps
        VERSION:  1.01
        CHANGE LOG - Version - When - What - Who
        1.00 - 03/10/2017 - Initial script - Alain Assaf
        1.01 - 03/10/2017 - Simplyfied script to just one line doing all the work - Alain Assaf
        LAST UPDATED:  03/10/2017
        AUTHOR:  Alain Assaf
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>get-xawgapps.ps1 -XMLBROKER BROKER -WORKERGROUP 'FINANCE APPS'
    
    Queries the BROKER and retrieves list of active published applications from 'FINANCE APPS'    
	
# Legal and Licensing
The get-xawgapps.ps1 script is licensed under the [MIT license][].

[MIT license]: LICENSE

# Want to connect?
* LinkedIn - https://www.linkedin.com/in/alainassaf
* Twitter - http://twitter.com/alainassaf
* Wag the Real - my blog - https://wagthereal.com
* Edgesightunderthehood - my other - blog https://edgesightunderthehood.com

# Help
I welcome any feedback, ideas or contributors.
