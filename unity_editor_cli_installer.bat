@echo off
set CURL_DOWNLOAD_PATH=%1
set UNITY_VERSION=%2
set UNITY_CHANGESET=%3
set UNITY_PATH="C:\Program Files\Unity\Hub\Editor\%UNITY_VERSION%\Editor\Unity.exe"
set HUB_INSTALLED_PATH="C:\Program Files\Unity Hub\Unity Hub.exe"

:VarChecker
if "%1" == "" (
	echo CURL_DOWNLOAD_PATH is empty
	goto Err
)
if "%2" == "" (
	echo UNITY_VERSION is empty
	goto Err
)
if "%3" == "" (
	echo UNITY_CHANGESET is empty
	goto Err
)

:GetUnityHub
echo Downloading Unity Hub to: %CURL_DOWNLOAD_PATH%
echo.-----------------------------------------------------------------------------------------------------------------------------.

if exist %CURL_DOWNLOAD_PATH%\UnityHubSetup.exe (
	echo UnityHubSetup.exe already downloaded to %CURL_DOWNLOAD_PATH%, moving to installation
	goto InstallEditorVersion
) else (
	curl -o "%CURL_DOWNLOAD_PATH%"/UnityHubSetup.exe https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.exe
)

:InstallUnityHub
call "%CURL_DOWNLOAD_PATH%\UnityHubSetup.exe" /S

:InstallEditorVersion
if exist %UNITY_PATH% (
	echo Unity version %UNITY_VERSION% already installed at %UNITY_PATH%, moving to module installation
	goto InstallEditorModules
) else (
	echo Installing Unity Editor version: %UNITY_VERSION%
	echo Release versions available:
	call %HUB_INSTALLED_PATH% -- --headless editors -r
	echo.-----------------------------------------------------------------------------------------------------------------------------.
	echo Installed editor versions:
	call %HUB_INSTALLED_PATH% --headless editors -i
	echo.-----------------------------------------------------------------------------------------------------------------------------.
	echo Current install path for editor version:
	call %HUB_INSTALLED_PATH% -- --headless ip -g
	echo.-----------------------------------------------------------------------------------------------------------------------------.
	echo Running install command:
	echo %HUB_INSTALLED_PATH% -- --headless install --version %UNITY_VERSION% --changeset %UNITY_CHANGESET%
	echo.-----------------------------------------------------------------------------------------------------------------------------.
)

:InstallEditorModules
echo Installing editor modules
echo %HUB_INSTALLED_PATH% -- --headless install-modules --version %UNITY_VERSION% -m ios android --childModules
echo.-----------------------------------------------------------------------------------------------------------------------------.
goto Complete

:Err
echo Error encountered during installation
pause

:Complete
echo Unity installation has now completed for version %UNITY_VERSION%
pause
