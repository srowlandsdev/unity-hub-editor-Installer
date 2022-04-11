# unity-hub-editor-Installer
BAT file that uses the local unity hub to install editors and modules over the hub command line interface

# Usage
1. Download the script to your machine
2. Create a shortcut from the file to the desktop
3. Right Click on the shortcut and select Properties
4. Under Target extend the launch with arguments for the unity hub installation path, editor version and changeset. Here is an example: "C:\Users\Sam\Desktop\unity-hub-editor-installer.bat" D:\Newfolder 2018.4.36f1 6cd387d23174
5. Click Apply once changes have been made
6. Run the newly modified shortcut

## Test Cases
1. During installation if CURL_DOWNLOAD_PATH is empty do not progress
2. During installation if UNITY_VERSION is empty do not progress
3. During installation if UNITY_CHANGESET is empty do not progress
4. During installation if UNITY_PATH is empty do not progress
5. During installation if HUB_INSTALLED_PATH empty do not progress
6. If UnityHubSetup.exe exists in the CURL_DOWNLOAD_PATH then proceed to editor installation
7. If UnityHubSetup.exe does not exist in the CURL_DOWNLOAD_PATH then download from web
8. After UnityHubSetup.exe has been downloaded call silent installation
9. If the unity version is already installed at the UNITY_PATH then proceed to module installation
10. If the unity version is not already installed then run installation command sequence
11. After editor has been installed then proceed to install modules for target version
12. Upon succesful installation of editor and modules or just modules complete installation
