$uri = "https://the-eye.eu/public/Games/eXo/eXoDOS_v5/eXo/eXoDOS/?fbclid=IwAR2j41YvmFAyXyoJ1nJb40SrGndZHab1XGdWR-t4DDnn3JsIyGQb9GltleI"
$result = Invoke-WebRequest -Uri $uri
$uriFront = "https://the-eye.eu/public/Games/eXo/eXoDOS_v5/eXo/eXoDOS/"
$games = $result.Links
$localFolder = "C:\GamesDos"
$gamesCount = $games | measure

[int]$i = 0
$game = @()

foreach($game in $games){
    $i++
    if($game.outerText -notmatch "../"){
        Write-Host "Game $($i) of $($gamesCount)"
        Write-Host "Downloading $($game.outerText)..."
        Invoke-WebRequest -Uri "$($uriFront)$($game.href)" -OutFile "$($localFolder)\$($game.outerText)"
        }
    }