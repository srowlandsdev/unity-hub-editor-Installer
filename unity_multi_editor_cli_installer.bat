@echo off
set CURL_DOWNLOAD_PATH=%1
set UNITY_VERSIONS=%2
set UNITY_PATH="C:\Program Files\Unity\Hub\Editor\%UNITY_VERSION%\Editor\Unity.exe"
set HUB_INSTALLED_PATH="C:\Program Files\Unity Hub\Unity Hub.exe"

:VarChecker
if "%1" == "" (
	echo CURL_DOWNLOAD_PATH is empty
	goto VarErr
)
if "%2" == "" (
	echo UNITY_VERSIONS is empty
	goto VarErr
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

(for %%a in(%UNITY_VERSIONS%) do (
	call :InstallEditorVersion %%a
)

:InstallEditorVersion
if exist %UNITY_PATH% (
	echo Unity version %~1 already installed at %UNITY_PATH%, moving to module installation
	goto InstallEditorModules
) else (
	echo Installing Unity Editor version: %~1
	echo Release versions available:
	call %HUB_INSTALLED_PATH% -- --headless editors -r
	echo.-----------------------------------------------------------------------------------------------------------------------------.
	echo Installed editor versions:
	call %HUB_INSTALLED_PATH% -- --headless editors -i
	echo.-----------------------------------------------------------------------------------------------------------------------------.
	echo Current install path for editor version:
	call %HUB_INSTALLED_PATH% -- --headless ip -g
	echo.-----------------------------------------------------------------------------------------------------------------------------.
	echo Running install command:
	call %HUB_INSTALLED_PATH% -- --headless install --version %~1
	echo.-----------------------------------------------------------------------------------------------------------------------------.
)

:InstallEditorModules
echo Installing editor modules
call %HUB_INSTALLED_PATH% -- --headless install-modules --version %~1 -m ios android --childModules
echo.-----------------------------------------------------------------------------------------------------------------------------.
goto Complete

:VarErr
echo Error encountered during installation due to missing or improper variable
exit 1

:Complete
echo Unity installation has now completed for version %~1
exit 0
