# Simple Local AI

## Install Python 3.13 from MS Store

## Install ollama on windows 
irm https://ollama.com/install.ps1 | iex
## Pull images
ollama pull gemma3:1b-it-qat
ollama pull embeddinggemma
## Create custoim model from the Modelfile in the web dir
ollama create gemma-uk -f web/Modelfile
## Create shortcut on Desktop to lanch python web server.
## Make sure the working direcory points to the web directory in the repo
## Run in powershell
$Shell = New-Object -ComObject WScript.Shell

$Shortcut = $Shell.CreateShortcut(
    "$HOME\Desktop\WebServer.lnk"
)

$Shortcut.TargetPath = "$env:LOCALAPPDATA\Microsoft\WindowsApps\python3.exe"
$Shortcut.Arguments = "-m http.server 8000 --bind 127.0.0.1"
$Shortcut.WorkingDirectory = "$env:USERPROFILE\Desktop\web"
$Shortcut.Description = "Start Python Web Server"
$Shortcut.Save()

## Double click the shortcut to start web server
## Browse to http://localhost:8000

