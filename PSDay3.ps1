FUNCTIONS
Syntax:
function <function name> { <function code goes here> }
  Example - function Hello-World { 'Hello World!!!' }

To call a function just type out the name of the function
  Example - Hello-World
            Hello World!!!
Functions only exist for that individual powershell session/script
  Functions are stored in the function PSDrive
Get-Childitem function:*    <------- To view all the functions in the PS Session
Get-Content function:Hello-World      <------ See what the function does rather than call the function

Syntax for a function that uses parameters:
function <function name> ($parameter name) { <function code goes here> }
  Example - function basic-param ($value) {
              if ($value) {
                 Write-Host "The parameter is $value" -Forgroundcolor Green -Nonewline
              }
              else {
                 Write-Host "There is no paramter being passed" -Foregroundcolor Red
              }
More than one Parameter:
 function <function name> ($parameter1,$parameter2) { <function code goes here> }
  Example - Many-Params ($value1,$value2) {
            if ($value1 -gt $value2) {
              write-host "value1" -foregroundcolor Green -nonewline
              write-host " is bigger than " -nonewline
              write-host "value2" -foregroundcolor Red -nonewline
            }
            elif ($value2 -gt $value1) {
              write-host "value2" -foregroundcolor Red -nonewline
              write-host " is bigger than " -nonewline
              write-host "value1" -foregroundcolor Green -nonewline
            }
            else




PARAMETERS
Syntax for making parameters:
function <function name> {
param($Parameter='<Default Value>',$Parameter2='<Default Value>')
  <function code>
}

Example - function <Default-Params> {
          param(
            $Parameter1='90',$Parameter2='65535'
          )
            "The parameters passed are $Parameter1 and $Parameter2"
          }
          
Default-Params    =    The parameters passed are 90 and 65535
Default-Params 445 3389   =    The paramaters passed are 445 and 3389



SWITCH PARAMETERS
To declare a switch paramter, Syntax:
function <function name> {
  param(
    [Switch]
    $SwitchParam
  )
  <function code>
}

Boolean logic, On or off



MANDATORY PARAMETERS
Sytax for establishing mandatory parameters:
function <function name> {
  param(
    [Parameter(Mandatory=$true)]
      #The "Mandatory=$true" forces the function to rrequest a paramter if no Argument was specified when calling the function
    $param
  )
  <function code>
}


Example - function Mando-params {
            param(
              [Parameter(Mandatory=$true)]
              $param
            )
            "The argument `"$param`" was mandatory for the parameter"
          }


To avoid blank input:
Example - function Mando-params {
  param(
    [Parameter(Mandatory=$true)]
    $param
  )
  while ([string]::IsNullorWhiteSpace($param)) {                      <-------- "[string]::IsNullorWhiteSpace($param)" compare to see if something is null
    $param = read-host -prompt "enter a string"
    #If the parameter is Null/empty, it will prompt for a string of characters
    }
  "The argument `"$param`" was mandatory for the parameter"
}




POSITIONAL PARAMETERS
function Postitonal-Params {
  param(
    [Paramter(mandatory=$true,position=0)]
    [int]
    $number
    [Paramter(mandatory=$true,position=1)]
    [string]
    $string
    [Paramter(mandatory=$true,position=1)]
    [string]
    $anotherstring
    )
    <Function code>
}

    write-ouput "$number is the first positional parameter"
    write-output "$string is the second positional parameter"
    write-output "$anotherstring is the third positional parameter"
    


ADVANCED FUNCTIONS
function <function name> {
  param(
  [Paramter(Mandatory=$true,Helpmessage=<message>)]
  $param
)
"The arg `"param'` was mandatory for the paramter"

help-param = will assist on how to see what the help message is



PARAMETER SETS
function cmdlet-function {
   [cmdletBinding(Default='Tacos')]         <------ allows to add more capabilities to a function
      param(
        [Paramter(ParameterSetName="Tacos",Mandatory=$true)]   <---- adding "Position=#, in between the name set and the "Mandatory" makes this positional
        $flavor,
        [Paramter(ParameterSetName="Tacos",Mandatory=$true)]
        $cheese,
        [Paramter(ParameterSetName="Tacos",Mandatory=$true)]
        $spice,
        [Paramter(ParameterSetName="Burritos",Mandatory=$true)]
        $beans,
        [Paramter(ParameterSetName="Burritos",Mandatory=$true)]
        $rice,
        )
        
        $ParamterSetName = PSCmdlet.ParamterSetName
        "The $ParameterSetName Parameter Set was utilized"
}
  
      cmdlet-function          <------ will only apply to taco unless you specify the parameter set burritos
      cmdlet-function -beans "blackeyedpeas" -rice "dirty"     <------ signifies burritos is being used
      
      
      
      CMDLET BINDING
      function Function-Blocks {
      [cmdletbinding()]
        param()
        
        Begin {               <------ This block is used to provide optional one-time preprocessing for the function
                                      Does whatever is in here prior to anything else in the function
        }
        
        Process{              <------- This block is used to provide record-by-record processing for the function
                                       Executes code as many times as necessary based off of how many objects are sent to the function through the
                                       powershell pipeline
                                       Can use '$_' to grab the individual values passed to the function without having to call on $input or $args
       }
       
       End {                  <------- This block is used to provide optional one-time post-processing for the function
                                       Executes this code at the end of the function prior to exiting the function
       }
        
     }   
