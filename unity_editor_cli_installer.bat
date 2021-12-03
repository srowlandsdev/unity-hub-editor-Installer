@echo off

::Path to the hub is hard coded but for this you could also use a batch variable as has been done with the version and changeset
set hubpath="C:\Program Files\Unity Hub\Unity Hub.exe"
::For the version variable just pass a version like: 2021.2.3f1 as example
set editorversion=%1
::For the changeset you will need to refer to a release notes pages for the version an example would be: 4bf1ec4b23c9
set editorchangeset=%2

echo Available release versions:
%hubpath%\Unity Hub.exe -- --headless editors -r

echo Currently installed versions:
%hubpath%\Unity Hub.exe -- --headless editors -i

echo Current installation path:
%hubpath%\Unity Hub.exe -- --headless install-path -g

echo Installing Unity Editor %editorversion%
%hubpath%\Unity Hub.exe -- --headless install --version %editorversion% --changeset %editorchangeset%

echo Installing Unity Editor modules
%hubpath%\Unity Hub.exe -- --headless install-modules --version %editorversion% --changeset %editorchangeset% -m documentation -standardassets -example