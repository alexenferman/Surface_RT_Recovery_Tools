@echo off
Title Surface RT Recovery Tools 1.0 by Alexenferman
mode 120,30
goto warning

:warning
color 3f
echo     ________________________     
echo    ^|  _________o__________  ^|        Surface RT Recovery Tools by Alexenferman
echo    ^| ^|                    ^| ^|        Version 0.1 2020-07-01 Beta Preview     
echo    ^| ^|      Surface       ^| ^|        
echo    ^| ^|                    ^| ^|\       This tool is a semi automatic tool allowing you to disable secureboot, install
echo    ^| ^|                    ^| ^| \      wims, format partitions, and execute long commands without typing them by hand.
echo    ^| ^|____________________^| ^|__\          
echo    ^|________________________^|        (C) 2020 Alexenferman. All rights reserved
echo.                               
echo.  
echo.
echo   Agreement:
echo   -------------  
echo. 
echo   Alexenferman is not responsible for any damages or bricks made to your device. Please do some research if you have 
echo   any concerns about this tool, features and downsides. You are choosing to make these modifications, you should  
echo   blame yourself for any mistakes you make using this tool. This tool had no guarantee of working, or warranty. Use
echo   this tool at your own risk.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [Enter] - Accept and continue   [Ctrl+C] - Decline and Exit
pause > NUL






:home
cls
echo  Select an option:
echo  __________________________________________
echo.
echo  Secure Boot                                    EFI
echo  [1] Run Secure boot patch                      [13] Mount/Unmount EFI partition
echo  [2] Turn on Testsigning                        [14] Copy EFI files
echo.                                                [15] Repair/Recover EFI
echo  Partitions                                     
echo  [3] Format Partition 4
echo.
echo  Apply Windows images
echo  [4] Apply a Windows 8.0/8.1 image
echo  [5] Apply a Windows 10 image
echo.
echo  Windows 10
echo  [6] Set Setup.exe value to 3
echo  [7] Activate Windows 10 15035
echo  [8] Install Appx/Appxbundle Packages
echo  [9] Apply Camera Fix
echo  [10] Install optional cab packages
echo  [11] Remove expiring build error
echo  [12] Setup Pagefile
echo.
echo.
echo  [A] About this Project
echo  [V] Visit Github Repository
echo.
echo ________________________________________________________________________________________________________________________
set/p option=   Option: 
if %option% == 1 goto Secureboot
if %option% == 2 goto Testsigning
if %option% == 3 goto
if %option% == 4 goto Applyw8
if %option% == 5 goto Applyw10
if %option% == 6 goto
if %option% == 7 goto Activatew10
if %option% == 8 goto
if %option% == 9 goto CameraFix
if %option% == 10 goto InstallCab
if %option% == 11 goto Warnremove
if %option% == 12 goto Pagefile
if %option% == 13 goto EFI
if %option% == 14 goto EFIcopy
if %option% == a goto About
goto home

:Secureboot
cls
echo  Run Secure boot patch
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  start %cd%\resources\SecureBootPatch\InstallPolicy.cmd
echo.
echo  Continue?                         
echo. 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Securebootexecute
if %option% == n goto home
goto home

:Securebootexecute
cls
echo Beginning of LOG
echo =========================================
start %cd%\resources\SecureBootPatch\InstallPolicy.cmd
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:Testsigning
cls
echo  Turn on Testsigning  
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  bcdedit /set {default} testsigning on
echo  bcdedit /set {bootmgr} testsigning on
echo.                        
echo  Continue? 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Testsigningexecute
if %option% == n goto home
goto home

:Testsigningexecute
cls
echo Beginning of LOG
echo =========================================
bcdedit /set {default} testsigning on
bcdedit /set {bootmgr} testsigning on
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:: FORMAT PARTITION 4

:Applyw8
cls
echo  Apply a Windows 8.0/8.1 image
echo  __________________________________________
echo.
echo  Please enter the path of the wim:
echo  Example: d:\sources\install.wim
echo.
set /p wimpath=  Path: 


cls
echo  Apply a Windows 8.0/8.1 image
echo  __________________________________________
echo.
echo  The following command will be executed:
echo.
echo  dism /apply-image /imagefile:%wimpath% /applydir:c: /index:1
echo.
echo  Continue?                         
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Applyw8execute
if %option% == n goto home
goto home

:Applyw8execute
cls
echo Beginning of LOG
echo =========================================
dism /apply-image /imagefile:%wimpath% /applydir:c: /index:1
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home


:Applyw10
cls
color 6F
echo  Apply a Windows 10 image
echo  __________________________________________
echo   _
echo  /!\ Warning!
echo.  
echo  You must make sure that Secure Boot is actually disabled before proceeding! Do not skip this step, 
echo  otherwise, if you do not disable secureboot, your Surface RT might refuse to boot anything at all! 
echo  By this stage, Alexenferman is not responsible for any permanent damages or bricks made to your 
echo  device. You are choosing to make these modifications, you should blame yourself for any mistakes 
echo  you make. You have been warned! 
echo.
echo  Continue?                         
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [Enter] - Continue   [Ctrl+C] - Exit
pause > NUL
color 3f
cls
echo  Apply a Windows 10 image
echo  __________________________________________
echo.
echo  Please enter the path of the wim:
echo  Example: d:\sources\install.wim
echo.
set /p wimpath= Path: 


cls
echo  Apply a Windows 10 image
echo  __________________________________________
echo.
echo  The following command will be executed:
echo.
echo  dism /apply-image /imagefile:%wimpath% /applydir:c: /index:1
echo.
echo  Continue?                         
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Applyw10execute
if %option% == n goto home
goto home

:Applyw10execute
cls
echo Beginning of LOG
echo =========================================
dism /apply-image /imagefile:%wimpath% /applydir:c: /index:1
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:: Set Setup.exe value to 3

:Activatew10
cls
echo  Activate Windows 10 build 15035
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  slmgr.vbs /upk
echo  slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
echo  slmgr /skms kms.03k.org                     
echo  slmgr /ato
echo  slmgr /skms zhang.yt
echo.
echo  Continue? 
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Activatew10execute
if %option% == n goto home
goto home

:Activatew10execute
cls
echo Beginning of LOG
echo =========================================
slmgr.vbs /upk
slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
slmgr /skms kms.03k.org                     
slmgr /ato
slmgr /skms zhang.yt
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:: Install Appx/Appxbundle Packages

:CameraFix
cls
echo  Activate Windows 10 build 15035
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  start %cd%\resources\regfiles\Camera.reg
echo.
echo  Continue?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto CameraFixexecute
if %option% == n goto home
goto home

:CameraFixexecute
cls
echo Beginning of LOG
echo =========================================
start %cd%\resources\regfiles\Camera.reg
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:InstallCab
cls
echo  Install optional cab packages
echo  __________________________________________
echo.
echo  Please enter the path of the Cab file:
echo  Example: d:\sources\ie.cab
echo.
set /p cabpath=  Path: 


cls
echo  Install optional cab packages
echo  __________________________________________
echo.
echo  The following command will be executed:
echo.
echo  DISM.exe /Online /Add-Package /PackagePath:%cabpath%
echo.
echo  Continue?                         
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto InstallCabexecute
if %option% == n goto home
goto home

:InstallCabexecute
cls
echo Beginning of LOG
echo =========================================
DISM.exe /Online /Add-Package /PackagePath:%cabpath%
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:Warnremove
cls
echo  Run Secure boot patch
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  set filename="%SystemRoot%\System32\LicensingUI.exe"
echo  if exist %filename% (
echo  takeown /f %filename%                        
echo  icacls %filename% /grant *S-1-3-4:F /t /c /l
echo  rename %filename% "LicensingUI_1.exe"
echo  ) else (
echo  )
echo.
echo  Continue?
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Warnremoveexecute
if %option% == n goto home
goto home

:Warnremoveexecute
cls
echo Beginning of LOG
echo =========================================
set filename="%SystemRoot%\System32\LicensingUI.exe"
if exist %filename% (
  takeown /f %filename%
  icacls %filename% /grant *S-1-3-4:F /t /c /l
  rename %filename% "LicensingUI_1.exe"
  echo The operation completed successfully.
) else (
  echo LicensingUI was not found.
)
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:Pagefile
cls
echo  Setup Pagefile
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2048,MaximumSize=2048
echo.
echo  Continue?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Pagefileexecute
if %option% == n goto home
goto home

:Pagefileexecute
cls
echo Beginning of LOG
echo =========================================
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2048,MaximumSize=2048
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:EFI
cls
echo  Mount EFI
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  mountvol s: /s
echo  pause
echo  mountvol s: /d                                   
echo. 
echo  Continue?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto EFIexecute
if %option% == n goto home
goto home

:EFIexecute
cls
echo Beginning of LOG
echo =========================================
mountvol s: /s
echo =========================================
echo End of LOG
echo.
echo ^>^>^>^> Press enter to continue...
pause > NUL
echo.
echo Beginning of LOG
echo =========================================
mountvol s: /d
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home

:EFIcopy
cls
echo  Copy EFI files
echo  __________________________________________
echo.
echo  The following commands will be executed:
echo.
echo  XCOPY /i /S %cd%\EFI\* S:\EFI
echo.
echo  Continue?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo.
echo.  
echo.
echo.
echo ________________________________________________________________________________________________________________________
echo  [y] - Continue   [n] - Go to main menu
set /p option=
if %option% == y goto Pagefileexecute
if %option% == n goto home
goto home

:EFIcopy
cls
echo Beginning of LOG
echo =========================================
XCOPY /i /S %cd%\Resources\EFI\* S:\EFI
echo =========================================
echo End of LOG
echo.
echo Please take a look at the Log for any errors.
echo.
echo ^>^>^>^> Press enter to go to the Main Menu
pause > NUL
goto home
















:About
color 3f
echo About Surface RT Recovery Tools
echo ________________________________________
echo     ________________________     
echo    ^|  _________o__________  ^|        Surface RT Recovery Tools by Alexenferman
echo    ^| ^|                    ^| ^|        Version 0.1 2020-07-01 Beta Preview     
echo    ^| ^|      Surface       ^| ^|        
echo    ^| ^|                    ^| ^|\       This tool is a semi automatic tool allowing you to disable secureboot, install
echo    ^| ^|                    ^| ^| \      wims, format partitions, and execute long commands without typing them by hand.
echo    ^| ^|____________________^| ^|__\          
echo    ^|________________________^|        (C) 2020 Alexenferman. All rights reserved
echo. 
echo.                              
echo MIT License
echo Copyright (c) 2020 alexenferman
echo.
echo Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
echo documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
echo the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
echo to permit persons to whom the Software is furnished to do so, subject to the following conditions:
echo.
echo The above copyright notice and this permission notice shall be included in all copies or substantial portions 
echo of the Software.
echo.
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO 
echo THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
echo OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT 
echo OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
echo ________________________________________________________________________________________________________________________
echo  [Enter] - Go to Main Menu
pause > NUL
goto home



