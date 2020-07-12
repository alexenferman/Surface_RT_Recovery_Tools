@echo off
REM ********************************************************
REM                                                        *
REM    Copyright (C) Microsoft. All rights reserved.       *
REM                                                        *
REM ********************************************************
REM ********************************************************

cd "%~dp0"

manage-bde -protectors %systemdrive% -disable
mountvol S: /s 
copy /Y SecureBootDebug.efi s:\EFI\Microsoft\Boot\SecurebootDebug.efi

copy /Y SecureBootDebugPolicy.p7b s:\SecureBootDebugPolicy.p7b

set var={9809d174-88ef-11e1-8346-00155de8c610}

bcdedit /create "%var%" /d "KitsPolicyTool" /application osloader 

bcdedit /set "%var%" path "\EFI\Microsoft\Boot\SecureBootDebug.efi"

bcdedit /set {bootmgr} bootsequence "%var%"

bcdedit /set "%var%" loadoptions Install

mountvol s: /s 

bcdedit /set "%var%" device partition=S: 

mountvol s: /d
