@echo off
title AnonKryptiQuz
color a
setlocal

cls
echo Welcome to I-Espresso
echo Program made by AnonKryptiQuz
echo. 
set /p batchScriptName="Enter the name of your batch script file (with extension): "
set /p exeName="Enter the desired name for the EXE file (without extension): "
set /p extension="Enter the desired extension for the created EXE file (without dot): "

set sedFile=%exeName%.SED

(
  echo [Version]
  echo Class=IEXPRESS
  echo SEDVersion=3
  echo [Options]
  echo PackagePurpose=InstallApp
  echo ShowInstallProgramWindow=1
  echo HideExtractAnimation=1
  echo UseLongFileName=0
  echo InsideCompressed=0
  echo CAB_FixedSize=0
  echo CAB_ResvCodeSigning=0
  echo RebootMode=N
  echo InstallPrompt=%%InstallPrompt%%
  echo DisplayLicense=%%DisplayLicense%%
  echo FinishMessage=%%FinishMessage%%
  echo TargetName=%%TargetName%%
  echo FriendlyName=%%FriendlyName%%
  echo AppLaunched=%%AppLaunched%%
  echo PostInstallCmd=%%PostInstallCmd%%
  echo AdminQuietInstCmd=%%AdminQuietInstCmd%%
  echo UserQuietInstCmd=%%UserQuietInstCmd%%
  echo SourceFiles=SourceFiles
  echo [Strings]
  echo InstallPrompt=
  echo DisplayLicense=
  echo FinishMessage=
  echo TargetName=%CD%\%exeName%.%extension%
  echo FriendlyName=%exeName%
  echo AppLaunched=cmd /c %batchScriptName%
  echo PostInstallCmd=^<None^>
  echo AdminQuietInstCmd=
  echo UserQuietInstCmd=
  echo FILE0="%batchScriptName%"
  echo [SourceFiles]
  echo SourceFiles0=%CD%\
  echo [SourceFiles0]
  echo %%FILE0%%=
) > %sedFile%

iexpress /N %sedFile%
rename "%CD%\%exeName%.%extension%" "%exeName%.%extension%"
del %sedFile%

echo.
echo EXE file "%exeName%.%extension%" created successfully in the same directory.
pause
