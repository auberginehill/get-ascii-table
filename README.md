<!-- Visual Studio Code: For a more comfortable reading experience, use the key combination Ctrl + Shift + V
     Visual Studio Code: To crop the tailing end space characters out, please use the key combination Ctrl + Shift + X
     Visual Studio Code: To improve the formatting of HTML code, press Shift + Alt + F and the selected area will be reformatted in a html file.


   _____      _                          _ _ _______    _     _
  / ____|    | |          /\            (_|_)__   __|  | |   | |
 | |  __  ___| |_ ______ /  \   ___  ___ _ _   | | __ _| |__ | | ___
 | | |_ |/ _ \ __|______/ /\ \ / __|/ __| | |  | |/ _` | '_ \| |/ _ \
 | |__| |  __/ |_      / ____ \\__ \ (__| | |  | | (_| | |_) | |  __/
  \_____|\___|\__|    /_/    \_\___/\___|_|_|  |_|\__,_|_.__/|_|\___|
                                                                                      -->


## Get-AsciiTable.ps1

<table>
    <tr>
        <td style="padding:6px"><strong>OS:</strong></td>
        <td style="padding:6px">Windows</td>
    </tr>
    <tr>
        <td style="padding:6px"><strong>Type:</strong></td>
        <td style="padding:6px">A Windows PowerShell script</td>
    </tr>
    <tr>
        <td style="padding:6px"><strong>Language:</strong></td>
        <td style="padding:6px">Windows PowerShell</td>
    </tr>
    <tr>
        <td style="padding:6px"><strong>Description:</strong></td>
        <td style="padding:6px">ASCII stands for American Standard Code for Information Interchange (ASCII).
            <p>
                <table>
                    <tr>
                        <th>Definition:</th>
                        <td>The ASCII code is based on the English alphabet, and in the ASCII code a character such as 't' or '?' or an action of some sort is assigned with a numerical value.</td>
                    </tr>
                </table>
            </p>
            <p>ASCII was originally developed during the sixties for use with teleprinters and other teletypewriters (TTY) to code the messages, which were sent over various communications channels. The earliest teleprinters emulated the behavior of actual typewriters with rotating disks and other mechanical parts.</p>
            <p>The character set in the ASCII code is fairly limited; the ASCII code consists of 128 characters, which include 33 non-printing control characters (that affect how the text is being processed, but are nowadays rarely used for their original purposes) and 95 printable characters. Unfortunately there isn't any unified version of "extended ASCII" characters, only different encoding systems, such as ISO 8859-1 (also called as ISO Latin-1), which may or may not build upon the ASCII characters.</p>
            <p>Get-AsciiTable generates a series of numbers ranging from 0 to 255, and uses those numbers as a basis for the character retrieval system built in the PowerShell by using the "<code>[char]</code>number" -mechanism to recall a specific ASCII character. The HTML number generating parameters and other data has been added beforehand on the presumption that the enumeration starts from the first character (i.e. from the number zero character "(null)") and all the data is pretty much hard-coded. A far better solution would be that a current list would be fetched from somewhere, but good sources seem to be scarce and to connect to the Internet in this case seems a bit far fetched, too. This might, however, be an area of future development of Get-AsciiTable.</p>
    </tr>
    <tr>
        <td style="padding:6px"><strong>Homepage:</strong></td>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-ascii-table">https://github.com/auberginehill/get-ascii-table</a>
            <br />Short URL: <a href="http://tinyurl.com/hdjlqdu">http://tinyurl.com/hdjlqdu</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><strong>Version:</strong></td>
        <td style="padding:6px">1.0</td>
    </tr>
    <tr>
        <td style="padding:6px"><strong>Sources:</strong></td>
        <td style="padding:6px">
            <table>
                <tr>
                    <td style="padding:6px">Emojis:</td>
                    <td style="padding:6px"><a href="https://api.github.com/emojis">https://api.github.com/emojis</a></td>
                </tr>
                <tr>
                    <td style="padding:6px">Martin Pugh:</td>
                    <td style="padding:6px"><a href="https://community.spiceworks.com/scripts/show/1738-get-foldersizes">Get-FolderSizes</a></td>
                </tr>
                <tr>
                    <td style="padding:6px">Tobias Weltner:</td>
                    <td style="padding:6px"><a href="http://powershell.com/cs/media/p/24814.aspx">PowerTips Monthly Volume 2: Arrays and Hash Tables</a> (or one of the <a href="https://web.archive.org/web/20150714100009/http://powershell.com/cs/media/p/24814.aspx">archive.org versions</a>)</td>
                </tr>
                <tr>
                    <td style="padding:6px">PowerTip:</td>
                    <td style="padding:6px"><a href="https://blogs.technet.microsoft.com/heyscriptingguy/2015/09/01/powertip-verify-default-output-encoding-in-powershell/">Verify Default Output Encoding in PowerShell</a></td>
                </tr>
                <tr>
                    <td style="padding:6px">CB.:</td>
                    <td style="padding:6px"><a href="http://stackoverflow.com/questions/15114615/dynamic-parameter-accessing-default-value">Dynamic parameter accessing default value</a></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="padding:6px"><strong>Downloads:</strong></td>
        <td style="padding:6px">For instance <a href="https://raw.githubusercontent.com/auberginehill/get-ascii-table/master/Get-AsciiTable.ps1">Get-AsciiTable.ps1</a>. Or <a href="https://github.com/auberginehill/get-ascii-table/archive/master.zip">everything as a .zip-file</a>.</td>
    </tr>
</table>




### Screenshot

<img class="screenshot" title="screenshot" alt="screenshot" height="90%" width="90%" src="https://raw.githubusercontent.com/auberginehill/get-ascii-table/master/Get-AsciiTable.png">




### Parameters

<table>
    <tr>
        <th>:triangular_ruler:</th>
        <td style="padding:6px">
            <ul>
                <li>
                    <h5>Parameter <code>-Path</code></h5>
                    <p>which has an alias called <code>-ReportPath</code> (so they both act exactly the same way). The <code>-Path</code> parameter specifies where the HTML ASCII Table and the adjacent CSV-file is to be saved. The default save location is <code>$env:temp</code>, which points to the current temporary file location, which is set in the system. The default <code>-Path</code> save location is defined at line 12 with the <code>$Path</code> variable. If no save location is defined in the command, the files are saved to <code>$env:temp</code>.</p>
                    <p>It's not always mandatory to write <code>-Path</code> in the command to invoke the <code>-Path</code> parameter, as is shown in the Examples below, since Get-AsciiTable is trying to decipher the inputted commands as good as it is machinely possible within a 50 KB size limit.</p>
                    <p>The save location path should should be valid file system path to a directory (a full path name of a directory (i.e. folder path such as <code>C:\Windows</code>)). In case the path name includes space characters, please add quotation marks around the path name. For usage, please see the Examples below and for more information about <code>$env:temp</code> please see the Notes section below.</p>
                </li>
            </ul>
        </td>
    </tr>
    <tr>
        <th></th>
        <td style="padding:6px">
            <ul>
                <p>
                    <li>
                        <h5>Parameter <code>-Sort</code></h5>
                        <p>Specifies which column is the primary sort column in the HTML ASCII Table and other outputs. Only one column may be selected in one query as the primary column. If <code>-Sort</code> parameter is not defined, Get-AsciiTable will try to sort by Decimal.</p>
                        <p>In the HTML ASCII Table and other outputs all the headers are sortable (with the commands) and some headers have aliases, too. Valid <code>-Sort</code> values are listed below along with the default order (descending or ascending). Please also see the Examples section for further usage examples.</p>
                        <ol>
                            <h4>Valid <code>-Sort</code> values:</h4>
                            <p>
                                <table>
                                    <tr>
                                        <td rowspan="2" style="padding:6px"><strong>Value</strong></td>
                                        <td rowspan="2" style="padding:6px"><strong>Sort Behavior</strong></td>
                                        <td colspan="2" align="center" style="padding:6px"><strong>Default Order</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><strong>Descending</strong></td>
                                        <td style="padding:6px"><strong>Ascending</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Genus</code></td>
                                        <td style="padding:6px">Sort by Genus</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Universal</code></td>
                                        <td style="padding:6px">Sort by Universal</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Name</code></td>
                                        <td style="padding:6px">Sort by Name</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Decimal</code></td>
                                        <td style="padding:6px">Sort by Decimal</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>ASCII</code></td>
                                        <td style="padding:6px">Sort by Value</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Value</code></td>
                                        <td style="padding:6px">Sort by Value</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Type</code></td>
                                        <td style="padding:6px">Sort by Type</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>"HTML Number"</code></td>
                                        <td style="padding:6px">Sort by HTML Number</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>HTML</code></td>
                                        <td style="padding:6px">Sort by HTML Number</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Number</code></td>
                                        <td style="padding:6px">Sort by Number</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Character</code></td>
                                        <td style="padding:6px">Sort by Character</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Subset</code></td>
                                        <td style="padding:6px">Sort by Subset</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Printable</code></td>
                                        <td style="padding:6px">Sort by Printable</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Encoding</code></td>
                                        <td style="padding:6px">Sort by Encoding</td>
                                        <td align="center" style="padding:6px">(param)</td>
                                        <td align="center" style="padding:6px">Ascending</td>
                                    </tr>
                                </table>
                                <p>In the table above, (param) depicts the usage of the <code>-Descending</code> parameter.</p>
                            </p>
                        </ol>
                    </li>
                </p>
                <p>
                    <li>
                        <h5>Parameter <code>-Descending</code></h5>
                        <p>A switch to control how directories get sorted in the HTML ASCII Table and other outputs. Please see the <code>-Sort</code> parameter above for further details. By default Get-AsciiTable tries to sort everything in an ascending order. By adding the <code>-Descending</code> parameter to the command the prevalent ascending sort order may be reversed in the cases, which are listed in the table above and marked with (param).</p>
                    </li>
                </p>
                <p>
                    <li>
                        <h5>Parameter <code>-Encoding</code></h5>
                        <p>The <code>-Encoding</code> parameter sets the encoding in the generated CSV-file. Valid <code>-Encoding</code> values are listed below.<p>
                        <ol>
                            <h4>Valid <code>-Encoding</code> values:</h4>
                            <p>
                                <table>
                                    <tr>
                                        <td style="padding:6px"><strong>Parameter</strong></td>
                                        <td style="padding:6px"><strong>Value</strong></td>
                                        <td style="padding:6px"><strong>Full Parameter with a Value</strong></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="7" style="padding:6px"><code>-Encoding</code></td>
                                        <td style="padding:6px"><code>ASCII</code></td>
                                        <td style="padding:6px"><code>-Encoding ASCII</code></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>BigEndianUnicode</code></td>
                                        <td style="padding:6px"><code>-Encoding BigEndianUnicode</code></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Default</code></td>
                                        <td style="padding:6px"><code>-Encoding Default</code></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>Unicode</code></td>
                                        <td style="padding:6px"><code>-Encoding Unicode</code></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>UTF7</code></td>
                                        <td style="padding:6px"><code>-Encoding UTF7</code></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>UTF8</code></td>
                                        <td style="padding:6px"><code>-Encoding UTF8</code></td>
                                    </tr>
                                    <tr>
                                        <td style="padding:6px"><code>UTF32</code></td>
                                        <td style="padding:6px"><code>-Encoding UTF32</code></td>
                                    </tr>
                                </table>
                            </p>
                        </ol>
                        <p>If the <code>-Encoding</code> parameter is not used in the command, the CSV-file will be written using the UTF8 encoding.</p>
                    </li>
                </p>
            </ul>
        </td>
    </tr>
</table>




### Outputs

<table>
    <tr>
        <th>:arrow_right:</th>
        <td style="padding:6px">
            <ul>
                <li>Generates an HTML ASCII Table and an adjacent CSV-file in a specified Path (<code>$Path = "$env:temp"</code> at line 12), which is user-settable with the <code>-Path</code>  parameter. Please notice, that there probably is a glitch in the generated CSV-file (for more information, please see the Notes section). Displays culture related information in console. In addition to that...</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th></th>
        <td style="padding:6px">
            <ul>
                <p>
                    <li>One pop-up window "<code>$characters_selection</code>" (Out-GridView) with sortable headers (with a click):</li>
                </p>
                <ol>
                    <p>
                        <table>
                            <tr>
                                <td style="padding:6px"><strong>Name</strong></td>
                                <td style="padding:6px"><strong>Description</strong></td>
                            </tr>
                            <tr>
                                <td style="padding:6px"><code>$characters_selection</code></a></td>
                                <td style="padding:6px">Displays the ASCII Table</td>
                            </tr>
                        </table>
                    </p>
                </ol>
                <p>
                    <li>And also the aforementioned HTML-file "ASCII Table" and CSV-file at <code>$Path</code>. The HTML-file "ASCII Table" is opened automatically in the default browser after the query is finished.</li>
                </p>
                <ol>
                    <p>
                        <table>
                            <tr>
                                <td style="padding:6px"><strong>Path</strong></td>
                                <td style="padding:6px"><strong>Type</strong></td>
                                <td style="padding:6px"><strong>Name</strong></td>
                            </tr>
                            <tr>
                                <td style="padding:6px"><code>$env:temp\ascii_table.html</code></td>
                                <td style="padding:6px">HTML-file</td>
                                <td style="padding:6px"><code>ascii_table.html</code></td>
                            </tr>
                            <tr>
                                <td style="padding:6px"><code>$env:temp\ascii_table.csv</code></td>
                                <td style="padding:6px">CSV-file</td>
                                <td style="padding:6px"><code>ascii_table.csv</code></td>
                            </tr>
                        </table>
                    </p>
                </ol>
            </ul>
        </td>
    </tr>
</table>




### Notes

<table>
    <tr>
        <th>:warning:</th>
        <td style="padding:6px">
            <ul>
                <li>Please note that all the parameters can be used in one query command and that each of the parameters can be "tab completed" before typing them fully (by pressing the <code>[tab]</code> key).</li>
            </ul>
        </td>
    </tr>
    <tr>
        <th></th>
        <td style="padding:6px">
            <ul>
                <p>
                    <li>Please note that when the eight ASCII character "(bell)" (<code>[char]7</code> in the PowerShell language) is enumerated, an actual audible "bell" sound may occur. If that happens, it is intended action, and doesn't indicate nothing else than that the system in which Get-AsciiTable is run is following the ASCII principles by the book and is ASCII compatible. The "bell" sound is hard-coded to and assigned to the eight ASCII character, and is a reminescent of and a good representative of all the other control characters found amongst the first ASCII characters. The actual sound may vary according to the system and it may be agnostic to the OS sound level settings.</li>
                    <li>Please note that there is, however, probably an actual glitch happening. In the generated CSV-file on the second line (i.e. below the header row) the two first instances are written on a single line instead of each object (null-character and the start_of_heading-character) to their own line. This behavior seems to be prevalent, when the first ASCII character (null) (or as in the PowerShell language <code>[char]0</code>) enters the Export-Csv pipeline.</li>
                    <li>Please also note that the two files are created in a directory, which is end-user settable in each query command with the <code>-Path</code> parameter. The default save location is defined with the <code>$Path</code> variable (at line 12) and the <code>-Path</code> parameter also has an alias called <code>-ReportPath</code>. The default save location <code>$env:temp</code> variable points to the current temp folder. The default value of the <code>$env:temp</code> variable is <code>C:\Users\&lt;username&gt;\AppData\Local\Temp</code> (i.e. each user account has their own separate temp folder at path <code>%USERPROFILE%\AppData\Local\Temp</code>). To see the current temp path, for instance a command
                    <br />
                    <br /><code>[System.IO.Path]::GetTempPath()</code>
                    <br />
                    <br />may be used at the PowerShell prompt window <code>[PS>]</code>. To change the temp folder for instance to <code>C:\Temp</code>, please, for example, follow the instructions at <a href="http://www.eightforums.com/tutorials/23500-temporary-files-folder-change-location-windows.html">Temporary Files Folder - Change Location in Windows</a>, which in essence are something along the lines:
                        <ol>
                           <li>Right click on Computer and click on Properties (or select Start → Control Panel → System). In the resulting window with the basic information about the computer...</li>
                           <li>Click on Advanced system settings on the left panel and select Advanced tab on the resulting pop-up window.</li>
                           <li>Click on the button near the bottom labeled Environment Variables.</li>
                           <li>In the topmost section labeled User variables both TMP and TEMP may be seen. Each different login account is assigned its own temporary locations. These values can be changed by double clicking a value or by highlighting a value and selecting Edit. The specified path will be used by Windows and many other programs for temporary files. It's advisable to set the same value (a directory path) for both TMP and TEMP.</li>
                           <li>Any running programs need to be restarted for the new values to take effect. In fact, probably also Windows itself needs to be restarted for it to begin using the new values for its own temporary files.</li>
                        </ol>
                    </li>
                </p>
            </ul>
        </td>
    </tr>
</table>




### Examples

<table>
    <tr>
        <th>:book:</th>
        <td style="padding:6px">To open this code in Windows PowerShell, for instance:</td>
   </tr>
   <tr>
        <th></th>
        <td style="padding:6px">
            <ol>
                <p>
                    <li><code>./Get-AsciiTable</code><br />
                    Run the script. Please notice to insert <code>./</code> or <code>.\</code> before the script name. Uses the default location (<code>$env:temp</code>) for storing the generated HTML ASCII Table and the adjacent CSV-file to. Outputs the ASCII Table also in in a pop-up window (Out-GridView). The data is sorted by Decimal and ordered as ascending as default and the CSV-file is encoded in UTF8 as per default.</li>
                </p>
                <p>
                    <li><code>help ./Get-AsciiTable -Full</code><br />
                    Display the help file.</li>
                </p>
                <p>
                    <li><code>./Get-AsciiTable -Path "C:\Scripts"</code><br />
                    Run the script and store the two ASCII Table files to <code>C:\Scripts</code>. The output is sorted, as per default, on the Decimal property in an ascending order, displaying the smallest numbers on top and the largest numbers at the bottom. Since the <code>-Path</code> variable has an alias of <code>-ReportPath</code>, a command
                    <br />
                    <br /><code>./Get-AsciiTable -ReportPath "C:\Scripts"</code>
                    <br />
                    <br />will do the exactly same thing. Please note that the <code>-Path</code> is not mandatory in this example and that the quotation marks can be left out, since the path name doesn't contain any space characters (<code>./Get-AsciiTable C:\Scripts</code>).</li>
                </p>
                <p>
                    <li><code>./Get-AsciiTable -Path E:\chiore -Sort Value -Descending</code><br />
                    Run the script and save the files to <code>E:\chiore</code>. Sort the data based on the "Value" column and arrange the rows as descending so that the last ASCII characters come to the top and first ASCII characters will be at the bottom. To sort the same query in an ascending order the <code>-Descending</code> parameter may be left out from the query command (<code>./Get-AsciiTable -Path E:\chiore -Sort Value</code>).</li>
                </p>
                <p>
                    <li><code>./Get-AsciiTable -Path C:\Users\Dropbox -Encoding Unicode</code><br />
                    Will output the files to <code>C:\Users\Dropbox</code> and use the Unicode encoding, when writing the CSV-file. The output is sorted, as per default, on the Decimal property in an ascending order, displaying the smallest numbers on top and the largest numbers at the bottom.</li>
                </p>
                <p>
                    <li><code>./Get-AsciiTable -Path C:\Scripts -Sort Printable -Descending -Encoding UTF32</code><br />
                    Run the script and save the HTML ASCII Table and the adjacent CSV-file to <code>C:\Scripts</code>. Sort the data by the column name Printable in a descending order, and use UTF32 encoding, when writing the CSV-file. Please note, that <code>-Path</code> can be omitted in this example, because
                    <br />
                    <br /><code>./Get-AsciiTable C:\Scripts -Sort Printable -Descending -Encoding UTF32</code>
                    <br />
                    <br />will result in the exact same outcome.</li>
                </p>
                <p>
                    <li><p><code>Set-ExecutionPolicy remotesigned</code><br />
                    This command is altering the Windows PowerShell rights to enable script execution. Windows PowerShell has to be run with elevated rights (run as an administrator) to actually be able to change the script execution properties. The default value is "<code>Set-ExecutionPolicy restricted</code>".</p>
                        <p>Parameters:
                                <ol>
                                    <table>
                                        <tr>
                                            <td style="padding:6px"><code>Restricted</code></td>
                                            <td style="padding:6px">Does not load configuration files or run scripts. Restricted is the default execution policy.</td>
                                        </tr>
                                        <tr>
                                            <td style="padding:6px"><code>AllSigned</code></td>
                                            <td style="padding:6px">Requires that all scripts and configuration files be signed by a trusted publisher, including scripts that you write on the local computer.</td>
                                        </tr>
                                        <tr>
                                            <td style="padding:6px"><code>RemoteSigned</code></td>
                                            <td style="padding:6px">Requires that all scripts and configuration files downloaded from the Internet be signed by a trusted publisher.</td>
                                        </tr>
                                        <tr>
                                            <td style="padding:6px"><code>Unrestricted</code></td>
                                            <td style="padding:6px">Loads all configuration files and runs all scripts. If you run an unsigned script that was downloaded from the Internet, you are prompted for permission before it runs.</td>
                                        </tr>
                                        <tr>
                                            <td style="padding:6px"><code>Bypass</code></td>
                                            <td style="padding:6px">Nothing is blocked and there are no warnings or prompts.</td>
                                        </tr>
                                        <tr>
                                            <td style="padding:6px"><code>Undefined</code></td>
                                            <td style="padding:6px">Removes the currently assigned execution policy from the current scope. This parameter will not remove an execution policy that is set in a Group Policy scope.</td>
                                        </tr>
                                    </table>
                                </ol>
                        </p>
                    <p>For more information, please type "<code>help Set-ExecutionPolicy -Full</code>" or visit <a href="https://technet.microsoft.com/en-us/library/hh849812.aspx">Set-ExecutionPolicy</a>.</p>
                    </li>
                </p>
                <p>
                    <li><code>New-Item -ItemType File -Path C:\Temp\Get-AsciiTable.ps1</code><br />
                    Creates an empty ps1-file to the <code>C:\Temp</code> directory. The <code>New-Item</code> cmdlet has an inherent <code>-NoClobber</code> mode built into it, so that the procedure will halt, if overwriting (replacing the contents) of an existing file is about to happen. Overwriting a file with the <code>New-Item</code> cmdlet requires using the <code>Force</code>.<br />
                    For more information, please type "<code>help New-Item -Full</code>".</li>
                </p>
            </ol>
        </td>
    </tr>
</table>




### Contributing

<p>Find a bug? Have a feature request? Here is how you can contribute to this project:</p>

 <table>
   <tr>
      <th><img class="emoji" title="contributing" alt="contributing" height="28" width="28" align="absmiddle" src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f33f.png"></th>
      <td style="padding:6px"><strong>Bugs:</strong></td>
      <td style="padding:6px"><a href="https://github.com/auberginehill/get-ascii-table/issues">Submit bugs</a> and help us verify fixes.</td>
   </tr>
   <tr>
      <th rowspan="2"></th>
      <td style="padding:6px"><strong>Feature Requests:</strong></td>
      <td style="padding:6px">Feature request can be submitted by <a href="https://github.com/auberginehill/get-ascii-table/issues">creating an Issue</a>.</td>
   </tr>
   <tr>
      <td style="padding:6px"><strong>Edit Source Files:</strong></td>
      <td style="padding:6px"><a href="https://github.com/auberginehill/get-ascii-table/pulls">Submit pull requests</a> for bug fixes and features and discuss existing proposals.</td>
   </tr>
 </table>




### www

<table>
    <tr>
        <th><img class="emoji" title="www" alt="www" height="28" width="28" align="absmiddle" src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f310.png"></th>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-ascii-table">Script Homepage</a></td>
    </tr>
    <tr>
        <th rowspan="13"></th>
        <td style="padding:6px">Martin Pugh: <a href="https://community.spiceworks.com/scripts/show/1738-get-foldersizes">Get-FolderSizes</a></td>
    </tr>
    <tr>
        <td style="padding:6px">Tobias Weltner: <a href="http://powershell.com/cs/media/p/24814.aspx">PowerTips Monthly Volume 2: Arrays and Hash Tables</a> (or one of the <a href="https://web.archive.org/web/20150714100009/http://powershell.com/cs/media/p/24814.aspx">archive.org versions</a>)</td>
    </tr>
    <tr>
        <td style="padding:6px">PowerTip: <a href="https://blogs.technet.microsoft.com/heyscriptingguy/2015/09/01/powertip-verify-default-output-encoding-in-powershell/">Verify Default Output Encoding in PowerShell</a></td>
    </tr>
    <tr>
        <td style="padding:6px">CB.: <a href="http://stackoverflow.com/questions/15114615/dynamic-parameter-accessing-default-value">Dynamic parameter accessing default value</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="http://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom">Using PowerShell to write a file in UTF-8 without the BOM</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://blogs.msdn.microsoft.com/powershell/2006/12/11/outputencoding-to-the-rescue/">$OutputEncoding to the rescue</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://technet.microsoft.com/en-us/library/hh847796.aspx">about_Preference_Variables</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://technet.microsoft.com/en-us/magazine/hh360993.aspx">Windows PowerShell: Build a Better Function</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://msdn.microsoft.com/en-us/library/ms714434(v=vs.85).aspx">ValidateSet Attribute Declaration</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://technet.microsoft.com/en-us/library/hh847743.aspx">about_Functions_Advanced_Parameters</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="http://social.technet.microsoft.com/wiki/contents/articles/15994.powershell-advanced-function-parameter-attributes.aspx">PowerShell: Advanced Function Parameter Attributes</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://technet.microsoft.com/en-us/library/ee692803.aspx">Working with Hash Tables</a></td>
    </tr>
    <tr>
        <td style="padding:6px">ASCII Art: <a href="http://www.figlet.org/">http://www.figlet.org/</a> and <a href="http://www.network-science.de/ascii/">ASCII Art Text Generator</a></td>
    </tr>
</table>




### Related scripts

 <table>
    <tr>
        <th><img class="emoji" title="www" alt="www" height="28" width="28" align="absmiddle" src="https://assets-cdn.github.com/images/icons/emoji/unicode/0023-20e3.png"></th>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-battery-info">Get-BatteryInfo</a></td>
    </tr>
    <tr>
        <th rowspan="9"></th>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-computer-info">Get-ComputerInfo</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-directory-size">Get-DirectorySize</a></td>
    </tr>    
    <tr>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-installed-programs">Get-InstalledPrograms</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-installed-windows-updates">Get-InstalledWindowsUpdates</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-ram-info">Get-RAMInfo</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://gist.github.com/auberginehill/eb07d0c781c09ea868123bf519374ee8">Get-TimeDifference</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-time-zone-table">Get-TimeZoneTable</a></td>
    </tr>    
    <tr>
        <td style="padding:6px"><a href="https://github.com/auberginehill/get-unused-drive-letters">Get-UnusedDriveLetters</a></td>
    </tr>
    <tr>
        <td style="padding:6px"><a href="https://github.com/auberginehill/update-adobe-flash-player">Update-AdobeFlashPlayer</a></td>
    </tr>
</table>
