Name "ProB"
OutFile ${OUT_FILE}
InstallDir "$PROGRAMFILES\ProB"

LicenseData "..\..\LICENSE"

Page license
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "ProB (required)"
  SectionIn RO
  SetOutPath $INSTDIR

  RMDir /r "$INSTDIR"
  File /r "\\?\${SOURCE}\*.*"

  CreateShortCut "$DESKTOP\ProB.lnk" "$INSTDIR\atom.exe" ""

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB2" "DisplayName" "ProB"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB2" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB2" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
SectionEnd

Section "Start Menu Shortcuts"
  CreateDirectory "$SMPROGRAMS\ProB"
  CreateShortcut "$SMPROGRAMS\ProB\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortcut "$SMPROGRAMS\ProB\ProB.lnk" "$INSTDIR\atom.exe" "" "$INSTDIR\atom.exe" 0
SectionEnd

Section "Uninstall"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\ProB2"

  Delete $INSTDIR\*

  Delete "$DESKTOP\ProB.lnk"

  Delete "$SMPROGRAMS\ProB\*.*"

  RMDir /r "$SMPROGRAMS\ProB"
  RMDir /r "$INSTDIR"
SectionEnd
