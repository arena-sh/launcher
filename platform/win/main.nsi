!include "MUI2.nsh"
!define MUI_ICON "app.ico"
!define MUI_UNICON "app.ico"

;Name and file
Name "ArenaSH Launcher"
OutFile "ArenaSH_setup.exe"

;Default installation folder
InstallDir "$PROFILE\ArenaSH"

;Get installation folder from registry if available
InstallDirRegKey HKCU "Software\ArenaSH" ""

;Request application privileges for Windows Vista
RequestExecutionLevel user

!define MUI_ABORTWARNING

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "../../eula.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections


Section "Launcher" SecLauncher
  SectionIn RO
  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  File /r "build\exe.win-amd64-2.7\"

  ;Store installation folder
  WriteRegStr HKCU "Software\ArenaSH" "" $INSTDIR

  WriteRegStr HKCU "Software\Classes\arena" "" "URL:arena Protocol"
  WriteRegStr HKCU "Software\Classes\arena" "FriendlyTypeName" "arena protocol"
  WriteRegStr HKCU "Software\Classes\arena" "URL Protocol" ""
  WriteRegExpandStr HKCU "Software\Classes\arena\DefaultIcon" "" "%SystemRoot%\system32\shell32.dll,6"
  WriteRegStr HKCU "Software\Classes\arena\shell" "" "open"
  WriteRegStr HKCU "Software\Classes\arena\shell\open" "FriendlyAppName" "ArenaSH Launcher"
  WriteRegStr HKCU "Software\Classes\arena\shell\open\command" "" '"$INSTDIR\launcher.exe" %1'

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\ArenaSH" \
                 "DisplayName" "ArenaSH Launcher"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\ArenaSH" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\"" 

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecLauncher ${LANG_ENGLISH} "Launcher"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecLauncher} $(DESC_SecLauncher)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\*.*"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir /r "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\ArenaSH"
  DeleteRegKey HKCU "Software\Classes\arena"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\ArenaSH"

SectionEnd

