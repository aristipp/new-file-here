(*
	"New File Here" script created by Erwann MEST (http://www.kud.fr).
	This script creates a new file with a user-chosen name
	and opens it in the user's default application. 
	
	This is a fork of the original script "New Text File Here"
	created by Jonas Wisser (http://wisser.me)
	
	New File Here History:
	29/09/2011: New File Here is alive!

*)

try
	tell application "Finder" to set the currentFolder to (folder of the front window as alias)
on error
	set the currentFolder to path to desktop folder as alias
end try

set newfilename to ""
(*repeat while newfilename = ""*)
display dialog "Filename?" with title "Create a new file" with icon note default answer newfilename buttons {"Cancel", "OK"} default button 2
set newfilename to text returned of the result
(*end repeat*)
set currentFile to POSIX path of currentFolder & newfilename

do shell script "touch \"" & currentFile & "\""
do shell script "open \"" & currentFile & "\""