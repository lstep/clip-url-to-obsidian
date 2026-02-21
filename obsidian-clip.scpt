-- Fetch current URL and Title from Safari
tell application "Safari"
	set currentURL to URL of current tab of window 1
	set currentTitle to name of current tab of window 1
end tell

set currentDate to current date

-- Prepare the content for Obsidian note
set obsidianContent to "- [" & currentTitle & "](" & currentURL & ")" & linefeed & linefeed

-- Path to Obsidian file
set weekStamp to do shell script "date '+%Y-W%V'"
set yearStamp to do shell script "date '+%Y'"
set obsidianFilePath to "/home/foobar/MyVaultWeekly/" & yearStamp & "/" & weekStamp & ".md"

-- Check if file exists using 'do shell script' (more reliable for external volumes)
set fileExists to false
try
	do shell script "test -f " & quoted form of obsidianFilePath
	set fileExists to true
on error
	set fileExists to false
end try

-- Append content to file or create new one
if fileExists then
	try
		set fileRef to open for access POSIX file obsidianFilePath with write permission
		write obsidianContent to fileRef starting at eof
		close access fileRef
		display notification "Item captured in Obsidian" with title "Quick Capture - Obsidian"
	on error errMsg number errNum
		try
			close access POSIX file obsidianFilePath
		end try
		display dialog "An error occurred: " & errMsg & " (" & errNum & ")"
	end try
else
	try
		set fileRef to open for access POSIX file obsidianFilePath with write permission
		write obsidianContent to fileRef
		close access fileRef
		display notification "Item captured in Obsidian" with title "Quick Capture - Obsidian"
	on error errMsg number errNum
		try
			close access POSIX file obsidianFilePath
		end try
		display dialog "An error occurred: " & errMsg & " (" & errNum & ")"
	end try
end if
