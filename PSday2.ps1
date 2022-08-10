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
