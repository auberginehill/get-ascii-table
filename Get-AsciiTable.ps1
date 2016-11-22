<#
Get-AsciiTable.ps1
#>


[CmdletBinding()]
Param (
    [Parameter(ValueFromPipeline=$true,
    ValueFromPipelineByPropertyName=$true,
      HelpMessage='In which folder, directory or path would you like to save the generated ASCII Tables to? Please enter a valid file system path to a directory (a full path name of a directory (a.k.a. a folder) i.e. folder path such as C:\Windows). If the path name includes space characters, please add quotation marks around the path name.')]
    [Alias("ReportPath")]
	[string]$Path = "$env:temp",
    [string]$Sort = "Decimal",
    [ValidateSet("ASCII", "BigEndianUnicode", "Default", "Unicode", "UTF7", "UTF8", "UTF32")]
    [string]$Encoding = "UTF8",
    [switch]$Descending
)

    DynamicParam {

        # Ensure $Encoding is defined                                                         # Credit: CB.: "Dynamic parameter accessing default value"
        Try { [void]$Encoding }
        Catch { $Encoding = [string]::Empty }

            If ($Encoding -eq "ASCII") {
                Write-Verbose "Selected encoding ASCII"
                $csv_file_name = "ascii_table_ASCII.csv"

            } ElseIf ($Encoding -eq "BigEndianUnicode") {
                Write-Verbose "Selected encoding BigEndianUnicode"
                $csv_file_name = "ascii_table_BigEndianUnicode.csv"

            } ElseIf ($Encoding -eq "Default") {
                Write-Verbose "Selected encoding Default"
                $csv_file_name = "ascii_table_Default.csv"

            } ElseIf ($Encoding -eq "Unicode") {
                Write-Verbose "Selected encoding Unicode"
                $csv_file_name = "ascii_table_Unicode.csv"

            } ElseIf ($Encoding -eq "UTF7") {
                Write-Verbose "Selected encoding UTF7"
                $csv_file_name = "ascii_table_UTF7.csv"

            } ElseIf ($Encoding -eq "UTF8") {
                Write-Verbose "Selected encoding UTF8"
                $csv_file_name = "ascii_table_UTF8.csv"

            } ElseIf ($Encoding -eq "UTF32") {
                Write-Verbose "Selected encoding UTF32"
                $csv_file_name = "ascii_table_UTF32.csv"

            } Else {
                $csv_file_name = "ascii_table.csv"
            } # Else

    } # DynamicParam




Begin {


    # Establish some common variables such as an empty array for the results
    $computer = $env:COMPUTERNAME
    $characters = @()
    $skipped = @()
    $skipped_path_names = @()
    $empty_line = ""


    # Extra parameters for $Sort which could be used after ValidateSet attribute              # Credit: Martin Pugh: "Get-FolderSizes"
    Switch ($Sort)  {
        "html"      { $Sort = "HTML Number";Break }
        "ascii"     { $Sort = "Value";Break }
    } # switch




    # A function for creating alternating rows in HTML documents                              # Credit: Martin Pugh: "Get-FolderSizes"
    Function Set-AlternatingRows {
        [CmdletBinding()]
        Param (
            [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
            [object[]]$lines,

            [Parameter(Mandatory=$true)]
            [string]$CSS_even_class,

            [Parameter(Mandatory=$true)]
            [string]$CSS_odd_class
        )
        Begin {
            $class_name = $CSS_even_class
        } # Begin

        Process {
            ForEach ($line in $lines) {

                $line = $line.Replace("<tr>","<tr class=""$class_name"">")

                If ($class_name -eq $CSS_even_class) {
                    $class_name = $CSS_odd_class
                } Else {
                    $class_name = $CSS_even_class
                } # Else

                Return $line

            } # ForEach
        } # Process

    } # function (Set-AlternatingRows)




    # Display the default output encoding in PowerShell                                       # Credit: PowerTip: "Verify Default Output Encoding in PowerShell"
    $empty_line | Out-String
    $header_encoding = "Default Output Encoding in PowerShell"
    $coline_encoding = "-------------------------------------"
    Write-Output $header_encoding
    $coline_encoding | Out-String
    $OutputEncoding
    $empty_line | Out-String


    # Display the output encoding used in the Console and the prevalent culture
    $console = [Console]::Out
    $empty_line | Out-String
    $header_console = "Output Encoding Used in the Console"
    $coline_console = "-----------------------------------"
    Write-Output $header_console
    $coline_console | Out-String
    $console.Encoding
    $empty_line | Out-String
    $header_culture = "Culture"
    $coline_culture = "-------"
    Write-Output $header_culture
    $coline_culture | Out-String
    $console.FormatProvider.TextInfo
    [string]'Calendar: ' + $console.FormatProvider.DateTimeFormat.NativeCalendarName + ' (' + $console.FormatProvider.DateTimeFormat.calendar.AlgorithmType + ')'
    $empty_line | Out-String
    [string]$console.FormatProvider.ThreeLetterWindowsLanguageName + ': ' + $console.FormatProvider.EnglishName
    $empty_line | Out-String




    # Test if the path exists
    If ((Test-Path $Path) -eq $false) {

        $invalid_path_was_found = $true

        # Display an error message in console
        $empty_line | Out-String
        Write-Warning "'$Path' doesn't seem to be a valid path name."
        $empty_line | Out-String
        Write-Verbose "Please consider checking that the save location path '$Path' was typed correctly and that it is a valid file system path, which points to a directory. If the path contains space characters, please add quotation marks around the path name." -verbose
        $empty_line | Out-String
        Write-Verbose "In which folder, directory or path would you like to save the generated ASCII Tables to? Please enter a valid file system path to a directory (a full path name of a directory (a.k.a. a folder) i.e. folder path such as C:\Windows). If the path name includes space characters, please add quotation marks around the path name."
        $empty_line | Out-String
        $skip_text = "Couldn't open '$Path'..."
        Write-Output $skip_text


                # Add the path as an object (with properties) to a collection of skipped paths
                $skipped += $obj_skipped = New-Object -TypeName PSCustomObject -Property @{

                            'Unresolved Path Names'    = $Path
                            'Owner'                     = ""
                            'Created on'                = ""
                            'Last Updated'              = ""
                            'Size'                      = "-"
                            'Error'                     = "The path was not found on $computer."
                            'raw_size'                  = 0

                    } # New-Object


        # Add the path name to a list of failed path names
        $skipped_path_names += $Path


    } Else {

        # Resolve path (if path is specified as relative)
        $Path = Resolve-Path -Path $Path

    } # else (if)

} # begin




Process {

    # Generate a number list (0 - 255) and use it as a basis for the pipeline and process each number individually
    0..255 | ForEach-Object {


        # Set the HTML number (entity) parameters
        $html_number =  If (($_ -eq 129) -or ($_ -eq 141) -or ($_ -eq 143) -or ($_ -eq 144) -or ($_ -eq 157)) {
                            $continue = $true
                        } ElseIf (($_ -ge 0) -and ($_ -le 9)) {
                            [string]'&#00' + $_ + ';'
                        } ElseIf (($_ -ge 10) -and ($_ -le 31)) {
                            [string]'&#0' + $_ + ';'
                        } ElseIf (($_ -ge 32) -and ($_ -le 255)) {
                            [string]'&#' + $_ + ';'
                        } Else {
                            $continue = $true
                        } # else


        # Give names to the Control Characters
        # Source: http://www.neurophys.wisc.edu/comp/docs/ascii/
        If       ($_ -eq 0  ) { $character = '[NUL]'
        } ElseIf ($_ -eq 1  ) { $character = '[SOH]'
        } ElseIf ($_ -eq 2  ) { $character = '[STX]'
        } ElseIf ($_ -eq 3  ) { $character = '[ETX]'
        } ElseIf ($_ -eq 4  ) { $character = '[EOT]'
        } ElseIf ($_ -eq 5  ) { $character = '[ENQ]'
        } ElseIf ($_ -eq 6  ) { $character = '[ACK]'
        } ElseIf ($_ -eq 7  ) { $character = '[BEL]'
        } ElseIf ($_ -eq 8  ) { $character = '[BS]'
        } ElseIf ($_ -eq 9  ) { $character = '[HT]'
        } ElseIf ($_ -eq 10 ) { $character = '[LF]'
        } ElseIf ($_ -eq 11 ) { $character = '[VT]'
        } ElseIf ($_ -eq 12 ) { $character = '[FF]'
        } ElseIf ($_ -eq 13 ) { $character = '[CR]'
        } ElseIf ($_ -eq 14 ) { $character = '[SO]'
        } ElseIf ($_ -eq 15 ) { $character = '[SI]'
        } ElseIf ($_ -eq 16 ) { $character = '[DLE]'
        } ElseIf ($_ -eq 17 ) { $character = '[DC1]'
        } ElseIf ($_ -eq 18 ) { $character = '[DC2]'
        } ElseIf ($_ -eq 19 ) { $character = '[DC3]'
        } ElseIf ($_ -eq 20 ) { $character = '[DC4]'
        } ElseIf ($_ -eq 21 ) { $character = '[NAK]'
        } ElseIf ($_ -eq 22 ) { $character = '[SYN]'
        } ElseIf ($_ -eq 23 ) { $character = '[ETB]'
        } ElseIf ($_ -eq 24 ) { $character = '[CAN]'
        } ElseIf ($_ -eq 25 ) { $character = '[EM]'
        } ElseIf ($_ -eq 26 ) { $character = '[SUB]'
        } ElseIf ($_ -eq 27 ) { $character = '[ESC]'
        } ElseIf ($_ -eq 28 ) { $character = '[FS]'
        } ElseIf ($_ -eq 29 ) { $character = '[GS]'
        } ElseIf ($_ -eq 30 ) { $character = '[RS]'
        } ElseIf ($_ -eq 31 ) { $character = '[US]'
        } ElseIf ($_ -eq 32 ) { $character = '[SP]'
        } ElseIf ($_ -eq 127) { $character = '[DEL]'
        } Else {
            $character = [char]$_
        } # else


        # Define the descriptions for the Control Characters
        # Source: https://tools.ietf.org/html/rfc20
        # Source: https://skew.org/iso-ir-001/
        # Reference: http://real-world-systems.com/docs/ANSIcode.html
        If       ($_ -eq 0  ) { $description = 'Null: A control character used to accomplish media-fill or time-fill (transmits a character with all bits = 0)'
        } ElseIf ($_ -eq 1  ) { $description = 'Start of Heading (start of header)'
        } ElseIf ($_ -eq 2  ) { $description = 'Start of Text (end of header)'
        } ElseIf ($_ -eq 3  ) { $description = 'End of Text: A transmission control character that terminates text'
        } ElseIf ($_ -eq 4  ) { $description = 'End of Transmission: The conclusion of the transmission of one or more texts'
        } ElseIf ($_ -eq 5  ) { $description = 'Enquiry, the first usage after the connection is established denotes the requesting of a response to the question "Who are you"'
        } ElseIf ($_ -eq 6  ) { $description = 'Acknowledged (an affirmative response sent back by the receiver to the original sender)'
        } ElseIf ($_ -eq 7  ) { $description = 'Bell: Rings the bell or beeps'
        } ElseIf ($_ -eq 8  ) { $description = 'Backspace: A format effector that moves the active position one character position backwards'
        } ElseIf ($_ -eq 9  ) { $description = 'Horizontal Tabulation: A format effector that moves the active position to the next predetermined horizontal stop'
        } ElseIf ($_ -eq 10 ) { $description = 'Line Feed: A format effector that moves the active position downward one line to the corresponding character position'
        } ElseIf ($_ -eq 11 ) { $description = 'Vertical Tabulation: A format effector that moves the active position downward on the next predetermined line without changing the corresponding character position'
        } ElseIf ($_ -eq 12 ) { $description = 'Form Feed: A format effector that moves the active position to the next form or page on a predetermined line without changing the corresponding character position (a distant relative to a page break)'
        } ElseIf ($_ -eq 13 ) { $description = 'Carriage Return: A format effector that moves the active position to the first character position (after the left margin) on the same line'
        } ElseIf ($_ -eq 14 ) { $description = 'Shift Out of ASCII, used in conjunction with [SI] and [ESC]'
        } ElseIf ($_ -eq 15 ) { $description = 'Shift In(to) ASCII, used in conjunction with [SO] and [ESC]'
        } ElseIf ($_ -eq 16 ) { $description = 'Data Link Escape: Escapes the following supplementary transmission control functions'
        } ElseIf ($_ -eq 17 ) { $description = 'Device Control 1 (for example ON)'
        } ElseIf ($_ -eq 18 ) { $description = 'Device Control 2'
        } ElseIf ($_ -eq 19 ) { $description = 'Device Control 3 (for example OFF)'
        } ElseIf ($_ -eq 20 ) { $description = 'Device Control 4'
        } ElseIf ($_ -eq 21 ) { $description = 'Negative Acknowledgment (a negative response sent back by the receiver to the original sender)'
        } ElseIf ($_ -eq 22 ) { $description = 'Synchronous Idle: Used by synchronous transmission systems to provide a signal from which synchronism may be achieved or retained'
        } ElseIf ($_ -eq 23 ) { $description = 'End of Transmission Block: Indicates the end of a transmission block of data (if the data is divided into such blocks)'
        } ElseIf ($_ -eq 24 ) { $description = 'Cancel: The preceding data is erraneous'
        } ElseIf ($_ -eq 25 ) { $description = 'End of Medium (indicating for example the end of the used portion of a medium or the physical end of the medium or the start of a "off the records" -section)'
        } ElseIf ($_ -eq 26 ) { $description = 'Substitute Character: A control character used (automatically) in the place of a character that has (automatically) been found to be invalid or in error'
        } ElseIf ($_ -eq 27 ) { $description = 'Escape: Escapes the following bit combinations to provide additional characters (an extended character set)'
        } ElseIf ($_ -eq 28 ) { $description = 'File Separator or Information Separator Four: A control character used to separate and qualify data; delimits a data item called a "file"'
        } ElseIf ($_ -eq 29 ) { $description = 'Group Separator or Information Separator Three: A control character used to separate and qualify data; delimits a data item called a "group"'
        } ElseIf ($_ -eq 30 ) { $description = 'Record Separator or Information Separator Two: A control character used to separate and qualify data; delimits a data item called a "record"'
        } ElseIf ($_ -eq 31 ) { $description = 'Unit Separator or Information Separator One: A control character used to separate and qualify data; delimits a data item called an "unit"'
        } ElseIf ($_ -eq 32 ) { $description = 'Blank Space character'
        } ElseIf ($_ -eq 127) { $description = 'Delete: Erase a character on the punched paper tape'
        } Else {
            $description = ''
        } # else




        # Add the foreach number in question as an object (with properties) to the collection of characters
        $characters += $obj_characters = New-Object -TypeName PSCustomObject -Property @{

                    'Number'        = $_
                    'Name'          = $_
                    'Decimal'       = $_
                    'Value'         = [char]$_
                    'Character'     = $character
                    'Description'   = $description
                    'HTML Number'   = $html_number
                    'Universal'     = If ($_ -le 127) { $true } Else { $false }
                    'Subset'        = If ($_ -le 127) { "-" } Else { "Something else than ASCII" }
                    'Genus'         = If ($_ -le 127) { "ASCII" } Else { "Something else than ASCII" }
                    'Encoding'      = If ($_ -le 127) { "ASCII" } Else { $console.Encoding.EncodingName }
                    'Printable'     = If ($_ -le 31) { $false } ElseIf ($_ -le 126) { $true } ElseIf ($_ -eq 127) { $false } Else { "Depends on the encoding" }
                    'Type'          = If ($_ -le 31) { "Control Character" } ElseIf ($_ -le 126) { "Printable Character" } ElseIf ($_ -eq 127) { "Control Character" } Else { "Depends on the encoding" }

                } # New-Object

    } # foreach

} # Process




End {


    # Display the characters in a pop-up window (Out-GridView)
    $characters.PSObject.TypeNames.Insert(0,"ASCII Characters")
    $characters_selection = $characters | Select-Object 'Genus','Universal','Name','Decimal','Value','Type','HTML Number','Number','Character','Description','Subset','Printable','Encoding' | Sort-Object -property $Sort -Descending:$Descending
    $characters_selection | Out-GridView


    # If the path couldn't be resolved, notify the user (the else below html) - otherwise write the files (the upper part of if statement)
    If (($invalid_path_was_found) -ne $true) {
        $enumeration_went_succesfully = $true


        # Write the characters to a CSV-file
        # the first ASCII (null) character [char]0 messes up the CSV-file...
            If ($characters_selection -ne $null) {
                $characters_selection | Export-Csv $Path\$csv_file_name -Delimiter ';' -NoTypeInformation -Encoding:$Encoding
            } Else {
                $continue = $true
            } # else


        # Create a HTML ASCII Table                                                           # Credit: Martin Pugh: "Get-FolderSizes"

        # Define the HTML header
        # In the CSS style section .even and .odd apply to the custom function Set-AlternatingRows (Outlook ignores "nth-child" definitions in CSS).
        # So after defining the custom function Set-AlternatingRows the .odd and .even are specified in the CSS style section.
        # After ConvertTo-Html has outputted to a pipeline Set-AlternatingRows is then allowed to change lines (from "<tr>" to "<tr class='$class_name'>") in the source code at hand.
        # To improve the formatting of HTML code in Visual Studio Code, press Shift + Alt + F and the selected area will be reformatted.


        $header = @"
<style>
    table {
        border-width: 1px;
        border-style: solid;
        border-color: black;
        border-collapse: collapse;
    }

    th {
        border-width: 1px;
        padding: 3px;
        border-style: solid;
        border-color: black;
        background-color: #6495ED;
    }

    td {
        border-width: 1px;
        padding: 3px;
        border-style: solid;
        border-color: black;
    }

    .odd {
        background-color: #ffffff;
    }

    .even {
        background-color: #dddddd;
    }
</style>
<title>
    ASCII Table
</title>
"@


        $ascii = $characters_selection | Where-Object { $_.Encoding -eq "ASCII" }
        $printable = $characters_selection | Where-Object { $_.Printable -eq "True" }
        $control = $characters_selection | Where-Object { $_.Type -eq "Control Character" }


        $pre = "<h1>ASCII Table</h1><h3>Listing $($ascii.Count) ASCII characters and $($characters_selection.Count - $ascii.Count) other characters</h3>"
        $post = "<h3>Total: $($characters_selection.Count) characters<br />ASCII characters: $($ascii.Count)<br />Printable: $($printable.Count)<br />Control Characters: $($control.Count)<br />Other than ASCII characters: $($characters_selection.Count - $ascii.Count)</h3><p>Generated: $(Get-Date -Format g)<br />Computer: $computer</p>"


        # Create the ASCII Table and save it to a file
        $HTML = $characters_selection | ConvertTo-Html -PreContent $pre -PostContent $post -Head $header -As Table | Set-AlternatingRows -CSS_even_class even -CSS_odd_class odd | Out-File -Encoding UTF8 $Path\ascii_table.html


        # Display the ASCII Table in the default browser
        # & $Path\ascii_table.html
        Start-Process -FilePath "$Path\ascii_table.html" | Out-Null


    } Else {
        $enumeration_went_succesfully = $false

        # Display the skipped path names in console
        $empty_line | Out-String
        $skipped.PSObject.TypeNames.Insert(0,"Skipped Path Names")
        $skipped_selection = $skipped | Select-Object 'Unresolved Path Names','Size','Error' | Sort-Object 'Unresolved Path Names'
        $skipped_selection | Format-Table -auto
        $stats_text = "The files were not created."
        $empty_line | Out-String
        Write-Output $stats_text
        $empty_line | Out-String

    } # else

} # End




# [End of Line]


<#


   _____
  / ____|
 | (___   ___  _   _ _ __ ___ ___
  \___ \ / _ \| | | | '__/ __/ _ \
  ____) | (_) | |_| | | | (_|  __/
 |_____/ \___/ \__,_|_|  \___\___|


https://community.spiceworks.com/scripts/show/1738-get-foldersizes                            # Martin Pugh: "Get-FolderSizes"
http://powershell.com/cs/media/p/24814.aspx                                                   # Tobias Weltner: "PowerTips Monthly Volume 2: Arrays and Hash Tables"
https://blogs.technet.microsoft.com/heyscriptingguy/2015/09/01/powertip-verify-default-output-encoding-in-powershell/   # PowerTip: "Verify Default Output Encoding in PowerShell"
http://stackoverflow.com/questions/15114615/dynamic-parameter-accessing-default-value         #  CB.: "Dynamic parameter accessing default value"
http://www.neurophys.wisc.edu/comp/docs/ascii/                                                # Ravi Kochhar: "ASCII Table: 7-bit"
https://tools.ietf.org/html/rfc20                                                             # "ASCII format for Network Interchange"
https://skew.org/iso-ir-001/                                                                  # "The Set Of Control Characters Of ISO 646"


  _    _      _
 | |  | |    | |
 | |__| | ___| |_ __
 |  __  |/ _ \ | '_ \
 | |  | |  __/ | |_) |
 |_|  |_|\___|_| .__/
               | |
               |_|
#>

<#

.SYNOPSIS
Generates ASCII Tables in a specified encoding to a specified location.

.DESCRIPTION
ASCII stands for American Standard Code for Information Interchange (ASCII).


Definition:     The ASCII code is based on the English alphabet, and in the ASCII
                code a character such as 't' or '?' or an action of some sort is
                assigned with a numerical value.


ASCII was originally developed during the sixties for use with teleprinters and
other teletypewriters (TTY) to code the messages, which were sent over various
communications channels. The earliest teleprinters emulated the behavior of actual
typewriters with rotating disks and other mechanical parts.

The character set in the ASCII code is fairly limited; the ASCII code consists
of 128 characters, which include 33 non-printing control characters (that
affect how the text is being processed, but are nowadays rarely used for their
original purposes) and 95 printable characters. Unfortunately there isn't any
unified version of "extended ASCII" characters, only different encoding systems,
such as ISO 8859-1 (also called as ISO Latin-1), which may or may not build upon
the ASCII characters.

Get-AsciiTable generates a series of numbers ranging from 0 to 255, and uses those
numbers as a basis for the character retrieval system built in the PowerShell by using
the "[char]number" -mechanism to recall a specific ASCII character. The HTML numbers
and other data has been added beforehand on the presumption that the enumeration
starts from the first character (i.e. from the number zero character "(null)") and
all the data is pretty much hard-coded. A far better solution would be that a current
list would be fetched from somewhere, but good sources seem to be scarce and to
connect to the Internet in this case seems a bit far fetched, too. This might,
however, be an area of future development of Get-AsciiTable.

.PARAMETER Path
which has an alias called -ReportPath (so they both act exactly the same way).
The -Path parameter specifies where the HTML ASCII Table and the adjacent
CSV-file is to be saved. The default save location is $env:temp, which points to
the current temporary file location, which is set in the system. The default -Path
save location is defined at line 12 with the $Path variable. If no save location
is defined in the command, the files are saved to $env:temp.

It's not always mandatory to write -Path in the command to invoke the -Path
parameter, as is shown in the Examples below, since Get-AsciiTable is trying to
decipher the inputted commands as good as it is machinely possible within a 50 KB
size limit.

The save location path should be valid file system path to a directory (a full path
name of a directory (i.e. folder path such as C:\Windows)). In case the path name
includes space characters, please add quotation marks around the path name. For
usage, please see the Examples below and for more information about $env:temp,
please see the Notes section below.

.PARAMETER Sort
Specifies which column is the primary sort column in the HTML ASCII Table and other
outputs. Only one column may be selected in one command as the primary column.
If -Sort parameter is not defined, Get-AsciiTable will try to sort by Decimal.

In the HTML ASCII Table and other outputs all the headers are sortable (with the
commands) and some headers have aliases, too. Valid -Sort values are listed below
along with the default order (descending or ascending). Please also see the Examples
section for further usage examples.


    Valid -Sort values:

                                                                  Default Order
    Value                   Sort Behavior                   Descending  /  Ascending
    -----                   -------------                   ------------------------
    Genus                   Sort by Genus                   (param)       Ascending
    Universal               Sort by Universal               (param)       Ascending
    Name                    Sort by Name                    (param)       Ascending
    Decimal                 Sort by Decimal                 (param)       Ascending
    ASCII                   Sort by Value                   (param)       Ascending
    Value                   Sort by Value                   (param)       Ascending
    Type                    Sort by Type                    (param)       Ascending
    "HTML Number"           Sort by HTML Number             (param)       Ascending
    HTML                    Sort by HTML Number             (param)       Ascending
    Number                  Sort by Number                  (param)       Ascending
    Character               Sort by Character               (param)       Ascending
    Description             Sort by Description             (param)       Ascending
    Subset                  Sort by Subset                  (param)       Ascending
    Printable               Sort by Printable               (param)       Ascending
    Encoding                Sort by Encoding                (param)       Ascending



In the table above, (param) depicts the usage of the -Descending parameter.

.PARAMETER Descending
A switch to control how directories get sorted in the HTML ASCII Table and other
outputs. Please see the -Sort parameter above for further details. By default
Get-AsciiTable tries to sort everything in an ascending order. By adding the
-Descending parameter to the command the prevalent ascending sort order may be
reversed in the cases, which are listed in the table above and marked with (param).

.PARAMETER Encoding
The -Encoding parameter sets the encoding in the generated CSV-file. Valid -Encoding
values are listed below.


    Valid -Encoding values:


    Parameter               Value                       Full Parameter with a Value
    ---------               -----                       ---------------------------
    -Encoding               ASCII                       -Encoding ASCII
                            BigEndianUnicode            -Encoding BigEndianUnicode
                            Default                     -Encoding Default
                            Unicode                     -Encoding Unicode
                            UTF7                        -Encoding UTF7
                            UTF8                        -Encoding UTF8
                            UTF32                       -Encoding UTF32


If the -Encoding parameter is not used in the command, the CSV-file will be written
using the UTF8 encoding.

.OUTPUTS
Generates an HTML ASCII Table and an adjacent CSV-file in a specified Path
($Path = "$env:temp" at line 12), which is user-settable with the -Path parameter.
Please notice, that there probably is a glitch in the generated CSV-file (for more
information, please see the Notes section). Displays culture related information
in console. In addition to that...


One pop-up window "$characters_selection" (Out-GridView) with sortable headers (with a click):

        Name                                Description
        ----                                -----------
        $characters_selection               Displays the ASCII Table


And also the aforementioned HTML-file "ASCII Table" and CSV-file at
$Path. The HTML-file "ASCII Table" is opened automatically in the
default browser after the query is finished.

$env:temp\ascii_table.html           : HTML-file          : ascii_table.html
$env:temp\ascii_table.csv            : CSV-file           : ascii_table.csv

.NOTES
Please note that all the parameters can be used in one query command and that each
of the parameters can be "tab completed" before typing them fully (by pressing
the [tab] key).

Please note that when the eight ASCII character "(bell)" ([char]7 in the PowerShell
language) is enumerated, an actual audible "bell" sound may occur. If that happens,
it is intended action, and doesn't indicate nothing else than that the system in
which Get-AsciiTable is run is following the ASCII principles by the book and is
ASCII compatible. The "bell" sound is hard-coded to and assigned to the eight ASCII
character, and is a reminescent of and a good representative of all the other
control characters found amongst the first ASCII characters. The actual sound may
vary according to the system and it may be agnostic to the OS sound level settings.

Please note that there is, however, probably an actual glitch happening. In the
generated CSV-file on the second line (i.e. below the header row) the two first
instances are written on a single line instead of each object (null-character and
the start_of_heading-character) to their own line. This behavior seems to be
prevalent, when the first ASCII character (null) (or as in the PowerShell language
[char]0) enters the Export-Csv pipeline.

Please also note that the two files are created in a directory, which is end-user
settable in each command with the -Path parameter. The default save location is
defined with the $Path variable (at line 12) and the -Path parameter also has an
alias called -ReportPath. The default save location $env:temp variable points to
the current temp folder. The default value of the $env:temp variable is
C:\Users\<username>\AppData\Local\Temp (i.e. each user account has their own
separate temp folder at path %USERPROFILE%\AppData\Local\Temp). To see the
current temp path, for instance a command

    [System.IO.Path]::GetTempPath()

may be used at the PowerShell prompt window [PS>]. To change the temp folder for
instance to C:\Temp, please, for example, follow the instructions at
http://www.eightforums.com/tutorials/23500-temporary-files-folder-change-location-windows.html

    Homepage:           https://github.com/auberginehill/get-ascii-table
                        Short URL: http://tinyurl.com/hdjlqdu
    Version:            1.1

.EXAMPLE
./Get-AsciiTable

Run the script. Please notice to insert ./ or .\ before the script name.
Uses the default location ($env:temp) for storing the generated HTML ASCII Table
and the adjacent CSV-file to. Outputs the ASCII Table also in in a pop-up window
(Out-GridView). The data is sorted by Decimal and ordered as ascending as default
and the CSV-file is encoded in UTF8 as per default.

.EXAMPLE
help ./Get-AsciiTable -Full
Display the help file.

.EXAMPLE
./Get-AsciiTable -Path "C:\Scripts"

Run the script and store the two ASCII Table files to C:\Scripts. The output is
sorted, as per default, on the Decimal property in an ascending order,
displaying the smallest numbers on top and the largest numbers at the bottom.
Since the -Path variable has an alias of -ReportPath, a command

    ./Get-AsciiTable -ReportPath "C:\Scripts"

will do the exactly same thing. Please note that the -Path is not mandatory in this
example and that the quotation marks can be left out, since the path name doesn't
contain any space characters (./Get-AsciiTable C:\Scripts).

.EXAMPLE
./Get-AsciiTable -Path E:\chiore -Sort Value -Descending

Run the script and save the files to E:\chiore. Sort the data based on the "Value"
column and arrange the rows as descending so that the last ASCII characters come to
the top and first ASCII characters will be at the bottom. To sort the same query in
an ascending order the -Descending parameter may be left out from the query command
(./Get-AsciiTable -Path E:\chiore -Sort Value).

.EXAMPLE
./Get-AsciiTable -Path C:\Users\Dropbox -Encoding Unicode

Will output the files to C:\Users\Dropbox and use the Unicode encoding, when writing
the CSV-file. The output is sorted, as per default, on the Decimal property in an
ascending order, displaying the smallest numbers on top and the largest numbers at
the bottom.

.EXAMPLE
./Get-AsciiTable -Path C:\Scripts -Sort Printable -Descending -Encoding UTF32

Run the script and save the HTML ASCII Table and the adjacent CSV-file to C:\Scripts.
Sort the data by the column name Printable in a descending order, and use UTF32
encoding, when writing the CSV-file. Please note, that -Path can be omitted
in this example, because

    ./Get-AsciiTable C:\Scripts -Sort Printable -Descending -Encoding UTF32

will result in the exact same outcome.

.EXAMPLE
Set-ExecutionPolicy remotesigned

This command is altering the Windows PowerShell rights to enable script execution. Windows PowerShell
has to be run with elevated rights (run as an administrator) to actually be able to change the script
execution properties. The default value is "Set-ExecutionPolicy restricted".


    Parameters:

    Restricted      Does not load configuration files or run scripts. Restricted is the default
                    execution policy.

    AllSigned       Requires that all scripts and configuration files be signed by a trusted
                    publisher, including scripts that you write on the local computer.

    RemoteSigned    Requires that all scripts and configuration files downloaded from the Internet
                    be signed by a trusted publisher.

    Unrestricted    Loads all configuration files and runs all scripts. If you run an unsigned
                    script that was downloaded from the Internet, you are prompted for permission
                    before it runs.

    Bypass          Nothing is blocked and there are no warnings or prompts.

    Undefined       Removes the currently assigned execution policy from the current scope.
                    This parameter will not remove an execution policy that is set in a Group
                    Policy scope.


For more information, please type "help Set-ExecutionPolicy -Full" or visit
https://technet.microsoft.com/en-us/library/hh849812.aspx.

.EXAMPLE
New-Item -ItemType File -Path C:\Temp\Get-AsciiTable.ps1

Creates an empty ps1-file to the C:\Temp directory. The New-Item cmdlet has an inherent -NoClobber mode
built into it, so that the procedure will halt, if overwriting (replacing the contents) of an existing
file is about to happen. Overwriting a file with the New-Item cmdlet requires using the Force.
For more information, please type "help New-Item -Full".

.LINK
https://community.spiceworks.com/scripts/show/1738-get-foldersizes
http://powershell.com/cs/media/p/24814.aspx
https://blogs.technet.microsoft.com/heyscriptingguy/2015/09/01/powertip-verify-default-output-encoding-in-powershell/
http://stackoverflow.com/questions/15114615/dynamic-parameter-accessing-default-value
http://www.neurophys.wisc.edu/comp/docs/ascii/
https://tools.ietf.org/html/rfc20
https://skew.org/iso-ir-001/
http://real-world-systems.com/docs/ANSIcode.html
http://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom
https://blogs.msdn.microsoft.com/powershell/2006/12/11/outputencoding-to-the-rescue/
https://technet.microsoft.com/en-us/library/hh847796.aspx
https://technet.microsoft.com/en-us/magazine/hh360993.aspx
https://msdn.microsoft.com/en-us/library/ms714434(v=vs.85).aspx
https://technet.microsoft.com/en-us/library/hh847743.aspx
http://social.technet.microsoft.com/wiki/contents/articles/15994.powershell-advanced-function-parameter-attributes.aspx
https://technet.microsoft.com/en-us/library/ee692803.aspx

#>
