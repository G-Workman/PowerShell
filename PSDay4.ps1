POWERSHELL REGEX 
`        <------ escape character
`b       <------ backspace
'n       <------ newline
`0 = $null


@"
They said
`"Hello`"
@        <------ Here string

$HowManyNeeded = "One Petabyte can store $(1PB / 2.39MB) Instances of DOOM (1993)"      <----- to perform the calculation you need the $ in the front of ()

"string" -split("r")
> st
> ing

"C:\Windows\System32\System Management\Distribution\Client" -split('\\') Split the string on the \
("C:\Windows\System32\System Management\Distribution\Client" -split('\\'))[-1]   <---- grab the object at index one after the split


$arr = @('PSC', 'We_Graduated COSC', 'Happiness')
$arr -join('=')                                           <-------- joins each string with an =


"I really love the weather in California" -replace 'California','Florida'   <------ replace one word with another



REGEX
\d = digits
\D = anything except digits
\w = any letter number character
\W = not a letter number or character
\s = white space
\S = not whitespace
\n = newline
\b = boundary
$ = beginning of the pattern
^ = end of the pattern
| = or
[a-z] = any lowercase letter a-z
[abz] = either a, b, or z
(abz) = matches the pattern 'abz'
[^zxy] = anything except z, x, or y
& = and
* = anything
? = its either there one time or not there at all
{7} = exactly 7 times
{3,} = at least 3 times
{1,3} = minimum of 1 time, maximum of 3 times
+ = once or multiple

(yes|no) = yes or no
[a-z0-9] = lowercase alphanumeric
