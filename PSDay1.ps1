Powershell is NOT case senstitive
Parameter sets will limnit  which parameters can be used based on what parameters are already being used



COMMANDS
update-help <------ looks for help files in your current powershell, and downloads them if need be
-Force      <------ forces the command to work
-ErrorAction <----- When recieve an error, decide what you want the system to do with it, otions will appear after typing -ErrorAction
man = get-help (preset alias)
     new window with this command will open up a new window to look at the man page
get-command <-----  gets commands
get-command *fire* <------- gets every command with the word fire in it
get-command -Verb get  <----- gets every command with the verb get
get-command -noun *item* <------ gets every command with the word item
get-command | measure <----- counts the output of get-command




PARAMTERS
Get-Childitem -path C:\ -recurse -filter *.pf -name           <------ recurse is our switch parameter (places the list recursively)
Switch paramter: Boolean in nature. When used, the parameter is turned on, otherwise its off by default

Get-Childitem -path C:\ -recurse -filter *.pf -name     <------- -path is our positional parameter
Gives a parameter a fixed parameter, meaning -path goes directly with C:\ because C:\ is the next string that follows the positional parameter

get-service -name power,Dnscache    <------ to list multiple paramters, use a "," because a space to powershell is a different parameter

get-service -name power,Dnscache   <------ -name is a "common parameter" which mean it applies to most, if not all commands in powershell






ALIASES   <----- Local aliases that you create only live for the current powershell session
$alias:"command"    <----- gets you the alias for a command
$alias:man    =      help
get-alias -definition get-childitem    <------ gets all of the aliases for a cmdlet
get-alias -name dir     <------ gets the cmdlet for a given alias
set-alias dora explorer.exe    <------ when dora is entered into powershell, an explorer.exe is ran
del alias:"alias name"     <------ deletes an alias




VARIABLES ($)
Initializing and calling variables needs a dollar sign everytime that variable is mentioned.
$number = 61742
$number
> 61742
$number - 1     <----- variable substitution (using the variable rather than the number itself and subtracting 1 from it)
$var1,$var2 = 65535, -1      <------- How to create multiple variables in a single line
get-variable var1   <----- prints the variable and its associated value with it
$var3 = $null     <------ sets var3 to an empty string and once a result of a loop has been placed inside it resets for the next iteration of the loop
del variable:var3     <------ deletes the variable called var3


Environmental variables are systemwide variables, and if removed, just restart powershell
$env:Homepath    <------- $env signifies an environmental variable, and this variable is looking at your home directory path


TYPECASTING
$var.gettype().name    <------ get the current type of a variable
[int]$var = 42
[int]$var.getType().name   <------ if var was a integer, it would momentarily change var into a string to compare against another string but would not
stay as a string
[int]0xff      <-------- python converts hex to decmal
[int]
[string]
[array]
[float]





ARRAYS    <----- a list that can be indexed through
To compare an array to null:
if ( $array.Count -eq 0) { write-host "empty like my mind"}

$array=@()   <------- creates an empty array
$number_arr = 4,5,6   <------- creates an array called $number_ar with the values of 4,5,6 inside of it
[array]$blank_array = $null    <------- does not work because an array needs an actual value... not null

$x = "waifu for lifu"
$x -is [array]
> False

$poly_array = (get-computerinfo), "help me, im trapped", 6472       <----- an arrray of different item types... the () says execute this command first
> Prints the entire output for the command as well as the string and the number, but still counts it as three objects in the array

$poly_arr[1]   <------- grabs index one (object 2) of an array

$seq_nums = 4..50   <------ outs every number 4-50 in an array
$seq.nums[-1]     <------- grabs the last index of the list
$seq_nums[1,41,20,4]    <------- grabs the value at index 1, 41, 20, and 4







JAGGED ARRAYS     <----- Nested arrays

$array = {1,2,3}
$nested = @,!,$array,#
Powershell interpretation : {@,!,{1,2,3},#}
Human View
@,                            =              @,$null,$null
!,                            =              !,$null,$null
1,   2,   3                   =              1,2,3
#,                            =              #,$null,$null

nested[2] = 1,2,3
$nested[2][1] = 2
nested[3][1] = $error



MULTIDIMENSIONAL ARRAY
$mult = tri, square, $nested, cir
Powershell Interpretation: {tri, square, {@,!,{1,2,3},#},cir}
Human View
tri, $null, $null, $null
square, $null, $null, null
@    , !  , 1  , #
$null, $null, 2 , $null
$null,$null, 3 , $null
cir, $null, $null, $null

$multi[2] = @,!,{1,2,3},#
$multi[2][2] = 1,2,3
$multi[2][2][1] = = 2
multi[1][2][3] = $error


NEED TO KNOW AUTOMATIC VARIABLES
$_             <-------- current object in the pipeline
$args          <-------- array of values for undeclared paramters
$input         <-------- an enumerator which enumerates everythiong that has poassed through a function
$profile       <-------- Contains the full path of the powershell profile for the current user and the current host application.
$null          <-------- the void, does not mean "empty"
$true          <-------- true
$false         <-------- false
