# unity-hub-editor-Installer
BAT file that uses CURL to download the UnityHubSetup.exe file then install it and a chosen version of Unity

# Installation
1. Download the script to your machine
2. Create a shortcut from the file to the desktop
3. Right Click on the shortcut and select Properties
4. Under Target extend the launch with arguments for the unity hub installation path, editor version and changeset. Here is an example: "C:\Users\Sam\Desktop\unity-hub-editor-installer.bat" D:\Newfolder 2018.4.36f1 6cd387d23174
5. Click Apply once changes have been made
6. Run the newly modified shortcut

# Shortcuts
Included with the script is a zip file with desktop shortcuts that are intended to run off the script. To use them download and extract the zip anywhere on your machine and follow these instructions:

1. Open each shortcut by right clicking and selecting Properties 
2. Modify the path to the BAT file under the Target section
3. Next modify the first agument which states where to download the UnityHubSetup.exe file
4. Leave the unity version and changeset as they are unless you intend to point to a different version when installing
5. Apply changes to the shortcuts and click Ok

# Notes
:warning:	Run the bat file or shortcuts as Administrator in order to avoid UAC popups

# Known Issues :bug:	
- Licensing SDK callback errors
  - These are not fatal and will not stop installation
- UAC Popups in non admin execution
  - Nothing can be done at this time other than decrease UAC alert level or run as admin

# Test Cases
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
