#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

SelectFileReady := False
SelectRegionReady := False
ErrorFound := False
SelectedFile := ""
SelectedRegion := ""
ResultMessage := ""

Gui, Main: New
Gui, Main: Add, Picture, w428 h-1 x38 y10, %A_ScriptDir%\assets\SetRegionBanner.png
Gui, Main: Add, Edit, x10 w400 hwndFilePath,
SetEditCueBanner(FilePath, "Drag & Drop .bin or Select File...")
Gui, Main: Add, Button, yp x+5 gSelectFile, Select File...
Gui, Main: Add, DropDownList, yp+35 x186.5 vRegionDropdown gSelectRegion, Select Region...||JAP|PAL|USA
Gui, Main: Add, Checkbox, x10 yp+35 vAddRegionText, Append "(JAP/PAL/USA-Injected)" to filename
GuiControl,, AddRegionText, 1
Gui, Main: Add, Checkbox, yp x310 vMakeBackup, Make a backup of the original file
Gui, Main: Add, Text,, `r`n
Gui, Main: Font, s18
Gui, Main: Add, Button, yp+20 x23.5 vConvertButton gConvertImage w450 disabled, Convert Region Sectors
Gui, Main: Font, s6
Gui, Main: Add, Text, x166 yp+65, "SetRegion" ©2001 by The Welder/Faith^Paradox
Gui, Main: Add, Text, x184 yp+11, "SetRegion GUI" ©2022 by wad11656
Gui, Main: Show, AutoSize Center x493, SetRegion GUI
return

MainGuiDropFiles:
Loop Parse, A_GuiEvent, `n
{
	if (SubStr(A_LoopField, -3) = ".bin")
	{
		SelectedFile := A_LoopField
		ControlSetText, Edit1, %SelectedFile%
		SelectFileReady := True

		if (SelectFileReady = True) and (SelectRegionReady = True)
		{
			GuiControl, Enable, Button4
		} 
	}
	else if (SubStr(A_LoopField, -3) = ".cue")
	{
		MsgBox,, Wrong File Type, Drop the .bin — not the .cue
	}
	else
	{
		MsgBox,, Wrong File Type, Invalid file type. Only .bin is accepted.
	}
    return ; only first dropped file selected, others ignored
}
return ; in case the event been triggered with no files in list

SelectFile:
FileSelectFile, SelectedFile, 3, , Select PS1 Image File, RAW Binary Disc Image (*.bin)
if ErrorLevel=1
{
    ; The user didn't select anything.
}
else
{
    ControlSetText, Edit1, %SelectedFile%
    SelectFileReady := True

	if (SelectFileReady = True) and (SelectRegionReady = True)
	{
		GuiControl, Enable, Button4
	} 
}
return

SelectRegion:
GuiControlGet, SelectedRegion,, ComboBox1
if SelectedRegion != Select Region...
{
	SelectRegionReady := True
	GuiControl,, AddRegionText, Append "(%SelectedRegion%-Injected)" to filename

	if (SelectFileReady = True) and (SelectRegionReady = True)
	{
		GuiControl, Enable, Button4
	}
}
else
{
	SelectRegionReady := False
	GuiControl,, AddRegionText, Append "(JAP/PAL/USA-Injected)" to filename
	GuiControl, Disable, Button4
}
return

ConvertImage:
ControlGetText, SelectedFile, Edit1
RunWait %ComSpec% /c assets\\SetRegion.exe "%SelectedFile%" %SelectedRegion% > temp.txt
FileRead, OutputContents, temp.txt
FileDelete, temp.txt
if (InStr(OutputContents, "File has been patched successfully!"))
{
	ResultMessage = Success!`r`n`r`nInjected %SelectedRegion% region sectors into image.
}
else
{
	OutputContents := StrReplace(OutputContents,"SetRegion V1.0 - By The Welder/Faith^Paradox", "")
	ResultMessage = ERROR:%OutputContents%`n(Make sure the disc image isn't opened in another program.)
	ErrorFound := True
}


ControlGet, MakeBackup, Checked,, Button3
if (MakeBackup = 1 && ErrorFound = False)
{
	if FileExist(SelectedFile)
	{
		StringTrimRight, SelectedFileRenamed, SelectedFile, 4
		SelectedFileCUE := SelectedFileRenamed . ".cue"
		if FileExist(SelectedFileCUE)
		{
			SelectedFileRenamedCUE := SelectedFileRenamed . " - Copy.cue"
			FileCopy, %SelectedFileCUE%, %SelectedFileRenamedCUE%
		}
		SelectedFileRenamed := SelectedFileRenamed . " - Copy.bin"
		FileCopy, %SelectedFile%, %SelectedFileRenamed%
	}
}


ControlGet, AddRegionText, Checked,, Button2
if (AddRegionText = 1 && ErrorFound = False)
{
	if FileExist(SelectedFile)
	{
		StringTrimRight, SelectedFileRenamed, SelectedFile, 4
		SelectedFileCUE := SelectedFileRenamed . ".cue"
		StringTrimRight, SelectedFileRenamedCUE, SelectedFileCUE, 4 
		substring := SubStr(SelectedFileRenamed, -14)

		if (SubStr(SelectedFileRenamed, -14) = " (JAP-Injected)" || SubStr(SelectedFileRenamed, -14) = " (PAL-Injected)" || SubStr(SelectedFileRenamed, -14) = " (USA-Injected)")
		{
			StringTrimRight, SelectedFileRenamed, SelectedFileRenamed, 15
		}
		if (SubStr(SelectedFileRenamedCUE, -14) = " (JAP-Injected)" || SubStr(SelectedFileRenamedCUE, -14) = " (PAL-Injected)" || SubStr(SelectedFileRenamedCUE, -14) = " (USA-Injected)")
		{
			StringTrimRight, SelectedFileRenamedCUE, SelectedFileRenamedCUE, 15
		}

		if FileExist(SelectedFileCUE)
		{
			SelectedFileRenamedCUE := SelectedFileRenamed . " (" . SelectedRegion . "-Injected).cue"
			FileMove, %SelectedFileCUE%, %SelectedFileRenamedCUE%

			FileRead, CUEContents, %SelectedFileRenamedCUE% ; Open copied CUE file
			CUEContents := SubStr(CUEContents, InStr(CUEContents,"`n") + 1) ; Delete 1st line

			; Get CUE's filename without the path
			StringGetPos, RightmostSlashPos, SelectedFileRenamedCUE, \, R,
			RightmostSlashPos++
			StringTrimLeft, SelectedFileRenamedTrimmedCUE, SelectedFileRenamedCUE, %RightmostSlashPos%
			StringTrimRight, SelectedFileRenamedTrimmedCUE, SelectedFileRenamedTrimmedCUE, 4
			CUEContents := "FILE """ . SelectedFileRenamedTrimmedCUE .  ".bin"" BINARY`r`n" . CUEContents

			File := FileOpen(SelectedFileRenamedCUE, "w")
			File.Write(CUEContents)
			File.Close()
		}
		SelectedFileRenamed := SelectedFileRenamed . " (" . SelectedRegion . "-Injected).bin"
		FileMove, %SelectedFile%, %SelectedFileRenamed%
	}
}
MsgBox,, Results, %ResultMessage%
ControlSetText, Edit1,
SelectFileReady := False
ErrorFound := False
Control, Choose, 1, ComboBox1
return

SetEditCueBanner(HWND, Cue)
{
	Static EM_SETCUEBANNER := (0x1500 + 1)
	Return DllCall("User32.dll\SendMessageW", "Ptr", HWND, "Uint", EM_SETCUEBANNER, "Ptr", True, "WStr", Cue)
}

MainGuiClose:
ExitApp