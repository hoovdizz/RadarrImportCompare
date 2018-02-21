# RadarrImportCompare
Dumps all movies radarr sees downloaded
Need powershell Major version 5
One time run of " Install-Module pssqlite -Scope CurrentUser -Force"

Edit were you want the CSV file to be placed in the powershell code. 

1.) Opens your radarr DB and pulls files it knows about
2.) Prompts for root folder you have movies in IE x:\plex\movies\ or \\server\plex\movies\
3.) Compares the 2 files
4.) Saves and shows all files listed from the file server, that wasnt in the Radarr DB
5.) Cleans up the other two text files it used

If you have multiple version of a movie IE 720 and 1080, radarr can only store one in the DB, so the other will show in the report. 
If the file is smaller than 15MB it will not show in the report, I did this filter as a short hand to ignore all the metadata. 
