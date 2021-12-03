@echo off

::Path to the hub is hard coded but for this you could also use a batch variable as has been done with the version and changeset
set hubpath="C:\Program Files\Unity Hub\Unity Hub.exe"

::Checking for the presence of the Hub exe, again if this is not default pathed then change the path or use a variable for the path
if not exist %hubpath%(
	echo No Unity Hub present at %hubpath%!
	exit 2
)

::For the version variable just pass a version like: 2021.2.3f1 as example
set editorversion=%1
::For the changeset you will need to refer to a release notes pages for the version an example would be: 4bf1ec4b23c9
set editorchangeset=%2

if [%1]==[] echo Editor version value is missing!
if [%2]==[] echo Editor changeset value is missing!

echo Available release versions:
%hubpath% -- --headless editors -r

echo Currently installed versions:
%hubpath% -- --headless editors -i

echo Current installation path:
%hubpath% -- --headless install-path -g

echo Installing Unity Editor %editorversion%
%hubpath% -- --headless install --version %editorversion% --changeset %editorchangeset%

echo Installing Unity Editor modules
%hubpath% -- --headless install-modules --version %editorversion% --changeset %editorchangeset% -m documentation -standardassets -example

exit 0
