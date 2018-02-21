#Need powershell Major version 5
#One time run of " Install-Module pssqlite -Scope CurrentUser -Force"
#Will install this modle  https://github.com/RamblingCookieMonster/PSSQLite
#Created to list what movies are show as downloaded in radar



Import-Module PSSQLite

#Things to change what you want.
$db_data_source = "C:\ProgramData\Radarr\nzbdrone.db"
$logfile = "C:\ProgramData\Radarr\downloadedmovies.csv"









#query to pull in movies that have the temp folder in the path
$db_query = "SELECT Movies.Path, MovieFiles.RelativePath, Moviefiles.DateAdded FROM `MovieFiles`, `Movies` WHERE movies.ID = MovieFiles.MovieID ORDER BY `MovieFiles.RelativePath`  ASC LIMIT 0, 50000;"

$pullrequest = Invoke-SqliteQuery -Query $db_query -DataSource $db_data_source 
if (-not ([string]::IsNullOrEmpty($pullrequest)))
{

$pullrequest | export-csv -Path $logfile

}




