#HASH

$hashy = @{key="value" ; key2="value2"}
$another = @{}
$another.IS_ANIME = "yes"
$another["IS_Good"] = "depends"
$another.add("OPM","Saitama")

$ordered = [ordered]@{}
$ordered."McDonalds" = @("BigMac", "1 Chiccy Nuggy", "7 Happy Meals", "1 Fillet-O-Fish", "2 Lg Fries")
$ordered["Chik-fil-a"]="2 Spicy Chicken Sandwiches"
$ordered.Add("Taco Bell", "a bad time")
$ordered.gettype().name #SHOULD BE ORDERED DICTIONARY

get-service | get-member # gives methods to the passed object
(get-service bfe).StartType # Parantheses represent the entire action before the next method/arguement

#CANNOT PIPE Write-Host; it displays directly to the console. PIPE Write-output

# Group by extension
Get-ChildItem | Sort-Object -Property Extension | Format-Table -GroupBy Extension 

Get-ChildItem | Sort-Object -Property status #Sorts Get-ChildItem by status
Get-ChildItem | Group-Object -Property status #Counts the number of each status

Get-Service | Where-Object { $_.Status -eq "Running" }

get-process svchost | select-object -expandproperty handles

Get-Process | where-object processname -ne "Idle" | Sort-Object StartTime | Select-object -last 10 | format-table ProcessName, StartTime

Get-ChildItem | measure-object Length -average -maximum -minimum -sum

compare-object $1 $2 -Property Length, Name

$mycar = New-Object object
add-member -membertype NoteProperty -Name Color -Value "Blue-Gray Green Turquoise Thing" -InputObject $mycar
add-member -membertype NoteProperty -Name Make -Value "Hondyota Fordoma" -InputObject $mycar
add-member -inputobject $mycar Noteproperty Model "Model Cherokee X Sport Maximus"
$mycar | add-member Noteproperty Cab "Big, Very Big Extended Quad Cab"
add-member -membertype Scriptmethod -Name Read -Value {"I'm not entirely sure this book is appropriate."} -Inputobject $mycar
add-member -membertype Scriptmethod -Name Cook -Value {"I hope my oi is human-friendly; It's all over everything"} -inputobject $mycar
add-member -membertype Scriptmethod -Name Drive -Value {"Are you Sure?"}  -inputobject $mycar
add-member -membertype Scriptmethod -Name Script -Value {"Give me all your parameters. I shall do it!"} -inputobject $mycar

$compinfo = Get-WmiObject Win32_ComputerSystem
$osinfo = Get-WmiObject Win32_OperatingSystem
$biosinfo = Get-WmiObject Win32_BIOS
$diskinfo = Get-WmiObject Win32_LogicalDisk

$mycomp = New-Object object


$mycomp | Add-Member -MemberType NoteProperty -Name ComputerName -Value $compinfo.Name
$mycomp | Add-Member -MemberType NoteProperty -Name OperatingSystem -Value $osinfo.Caption
$mycomp | Add-Member -MemberType NoteProperty -Name Version -force -Value $osinfo.version
$mycomp | Add-Member -MemberType NoteProperty -Name Manufacturer -Value $biosinfo.Manufacturer
$mycomp | Add-Member -MemberType NoteProperty -Name Disks -force -Value $diskinfo.DeviceID

$mycomp

_____EXTRA_____

HASH TABLES
Work on Key-value pairs, rather than objects themselves
$hashy = @{}      <------- declare an empty hash table
$hashy = @{key="value" ; key2="value2"}     <---- declare a hash table with multiple values
> name = key        >value = value
$hashy.gettype()
> hashtable

$another = @{}
$another.IS_Anime = "yes"                    <------- use this one to edit already added keys/values
Key/name = IS.Anime        value = yes

$another["IS_Good"] = "depends"              <------- use this one to edit already added keys/values
key/name = IS.Anime        value = yes
key/name = IS_Good         value = depends

$another.Add("OPM","Saitama")                <------ use this one to add keys/values
key/name = IS.Anime        value = yes
key/name = IS_Good         value = depends
key/name = OPM             value = Saitama



ORDERED HASH TABLE
$ordered = [ordered]@{}      <------ in order to make an ordered hash table you have to declare [ordered] the first time you add something to the hash table
$ordered."McDonalds" = @("BigMac" , "1 Chiccy Nuggy" , "7 Happy Meals", "1 Filet-of-Fish")    <---- adds an array with the key of Mcdonalds
$ordered["Chik-fil-A"]="2 Spicy Chicken Sandwiches"    <------ adds the key Chik-fil-a with the value of "2 Spicy Chicken Sandwiches"
$ordered.Add("Taco Bell", "a bad time")     <-------- adds the key taco bell with the value of a bad time
$ordered.'Chik-fil-A'    <------- References the exact value for the key of chik-fil-a

$ordered["McDonalds","Taco Bell"]     <------- References multiple keys to grab the values for 

$ordered.Keys      <----- shows just the keys in a hash table
$ordered.Values    <----- shows just the values in a hash table






PIPING                           <----- Powershell is object oriented so it is slightly different from bash
get-member <----- gives us attributes and properties
get-service | get-member         <----- pipes the result from a list of services into their attributes, this is giving us more information than just get-service

get-member gives us a cmdlet's, and other object's, methods and properties
(get-service bfe).StartType      <------ a cmdlet in parentheses grabs all of the cmdlet and sets it as an object
(service).stop                   <------ stops a service

get-service sorts itself aplhabetically by default, but to change it to sort by the status of the services:
get-service | sort-object -Property status          <------ property status is known to sort with because of get-service | get-member
get-service | sort-object -Property status, name    <------ sorts on status first, then the name of the service
get-service | groupt-object -Property status        <------ counts how many there are of each status rather than listing them in order
1, 7, 10, 8, 2, 3 | sort                            <------ sorts numerically
"1", "7", "10", "8", "2", "3" | sort                <------ sorts by ASCII
"1", "7", "10", "8", "2", "3" | sort -property { [Int]$_ }      <------- puts the order of these strings in order by their numerical representation
1..10 | sort -property { get-random }

| compare-object   <------ Helps you compare two different outputs



FILTERING
Where-object is the best cmdlet for filtering because is filters based on given terms
get-service | where-object { $_.Status -eq "Running }    <----- only grabs the services that are running

Get-Process svchost | select-object handles <------- grabs a portion of the output to filter out, in this case I'm grabbing the colum called handles
OR
(get-process svchost).handles

Get-Process | select-object -first 10    <------ grabs the first 10 objects of the output
Get-Process | select-object -last 10     <------ grabs the last 10 objects of the output
1,2,3,1,2,3,1,2,3,1,2,3 | sort | get-unique   <---- you must sort a list before trying to get the unique objects from it
get-childitem | measure-object length         <----- grabs the length of the cmdlet used, you can then set extra parameters (ie -average) to find the
other info:
Count    : 4327
Average  : 
Sum      : 
Maximum  : 
Minimum  : 
Property : length




WRITE-HOST VS WRITE-OUTPUT
Write-host- Prints a reult to the screen (YOU CAN NOT PIPE WITH WRITE HOST)
Write-Output- takes the command and puts it through the pipeline



FORMAT
Format-List   
Format-Table                                                       
Format-Wide                                                       




MAKING OBJECTS

Create new object using New-Object
$mycar = New-object object

Adding properties using add-member
Add-member -MemberType NoteProperty -name Color -value "blue-gray green turqouis Thing" -InputObject $mycar

Adding using shortened parameter names
Add-member -MemberType NoteProperty -name Make -value "Hondyota Fordoma" -InputObject $mycar

Adding using positional parameters
Add-member -InputObject $mycar NoteProperty Model "Model Cherokee X Sport Maximus"

Adding through a pipeline
$mycar | add-member NoteProperty Cab "Big, Very Big Extended Quad Cab"

Add-member -Membertype ScriptMethod -Name Read -value {"I'm not entirely sure this book is appropriate."} -InputObject $mycar

Add-member -membertype scriptmethod -name cook -value {"I hope my oil is human-friendly; It's all over everything"} -InputObject $mycar

Add-member -membertype scriptmethod -Name Drive -value {"Are you sure?"} -InputObject $mycar

Add-member -methodtype scriptmethod -name Script -value {"Give me all your parameters. I shall do it!"} -InputObject $mycar


$mycar.color    <------  Calling an object's property
$mycar.drive()  <------  Calling an objects attribute




CONDITIONALS
Always compares to the items on the left
"abc" -eq "abc", "def"      FALSE
"abc", "def" -eq "abc"      TRUE

7,8,9 -gt 8                 9

7,8,9 -lt 9                 7,8
