Name "ProB"
OutFile ${OUT_FILE}
InstallDir "$PROGRAMFILES\ProB 2.0"

LicenseData "..\..\LICENSE"

Page license
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "ProB 2.0 (required)"
  SectionIn RO
  SetOutPath $INSTDIR

  RMDir /r "$INSTDIR"
  File /r "\\?\${SOURCE}\*.*"

  CreateShortCut "$DESKTOP\ProB 2.0.lnk" "$INSTDIR\atom.exe" ""

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB 2.0" "DisplayName" "ProB 2.0"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB 2.0" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB 2.0" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
SectionEnd

Section "Start Menu Shortcuts"
  CreateDirectory "$SMPROGRAMS\ProB 2.0"
  CreateShortcut "$SMPROGRAMS\ProB 2.0\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortcut "$SMPROGRAMS\ProB 2.0\ProB 2.0.lnk" "$INSTDIR\atom.exe" "" "$INSTDIR\atom.exe" 0
SectionEnd

Section "Uninstall"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB 2.0"

  Delete $INSTDIR\*

  Delete "$DESKTOP\ProB 2.0.lnk"

  Delete "$SMPROGRAMS\ProB 2.0\*.*"

  RMDir /r "$SMPROGRAMS\ProB 2.0"
  RMDir /r "$INSTDIR"
SectionEnd
