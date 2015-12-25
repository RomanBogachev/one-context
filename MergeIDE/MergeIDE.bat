@echo off
if "%1"=="" goto noarg
set ctdir=%1:\i386
goto tryit

:noarg
set ctdir=%SystemRoot%\Driver Cache\i386

:tryit
if exist "%ctdir%\driver.cab" goto isda
echo *** Datei %ctdir%\Driver.cab nicht gefunden ***
echo.
echo Bitte legen Sie Ihre Windows-XP-Installations-CD ein und rufen Sie danach
echo dieses Programm erneut auf, wobei Sie den Laufwerksbuchsten Ihres CD-ROM-
echo Laufwerks als Parameter angeben. Der Befehl sollte also beispielsweise
echo.
echo %0 D
echo.
echo lauten, wobei Sie das D gegebenenfalls durch den Laufwerksbuchstaben
echo Ihres CD-ROM-Laufwerks (ohne Doppelpunkt) ersetzen müssen.
echo.
goto raus

:isda
echo Extrahiere Treiberdateien...
expand>NUL "%ctdir%\driver.cab" -f:Atapi.sys "%SystemRoot%\System32\Drivers"
if errorlevel 1 goto fehler1
expand>NUL "%ctdir%\driver.cab" -f:Intelide.sys "%SystemRoot%\System32\Drivers"
if errorlevel 1 goto fehler1
expand>NUL "%ctdir%\driver.cab" -f:Pciide.sys "%SystemRoot%\System32\Drivers"
if errorlevel 1 goto fehler1
expand>NUL "%ctdir%\driver.cab" -f:Pciidex.sys "%SystemRoot%\System32\Drivers"
if errorlevel 1 goto fehler1
echo Erledigt.
echo Eintragen der Registry-Settings...
regedit -s MergeIDE.reg
if errorlevel 1 goto fehler2
echo Erledigt.
goto raus

:fehler1
echo Fehler beim Extrahieren der Treiberdateien
goto raus

:fehler2
echo Fehler beim Eintragen der Registry-Settings
goto raus

:raus
set ctdir=