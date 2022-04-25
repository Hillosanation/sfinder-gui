#SingleInstance, Force

SetTitleMatchMode, 2

WinActivate, "sfinder gui but extended"

Gui, GUIWindow:New
Gui, Show, w600 h400
Gui, Add, Text, y10, Command type: 
Gui, Add, DropDownList, vVarChooseCommand AltSubmit w70 x90 yp-4 gUpdateCommand, percent||path|setup|ren|spin|cover

Gui, Add, GroupBox, x10 y40 w300 h170, Inputs
	Gui, Add, Text, xp+10 yp+20, Fumen:
	Gui, Add, Edit, xp+120 yp-5 w100 h20 hwndFumen vVarFumen -Wrap -Multi, v115@9gC8EeE8DeF8CeG8DeC8JeAgH

	Gui, Add, CheckBox, hwndFumenPathBool vVarFumenPathBool xp-100 yp+30 gFumenPathLock, Use fumen path: 
	Gui, Add, Edit, xp+100 yp-3 w100 h20 hwndFumenPath vVarFumenPath -Wrap -Multi, %A_ScriptDir%\input\field.txt
	Gui, Add, Button, xp+110 yp hwndSelectFumenFile gSelectFumenFileFunc -Wrap -Multi, Browse

	Gui, Add, Text, xp-230 yp+30, Page:
	Gui, Add, Edit, xp+120 yp-5 w40 hwndPage vVarPage -Wrap -Multi, 1

	Gui, Add, Text, xp-120 yp+30, Pattern:
	Gui, Add, Edit, xp+120 yp-5 w100 hwndPattern vVarPattern -Wrap -Multi, I,[IJLOSTZ]p3,

	Gui, Add, CheckBox, hwndPatternPathBool vVarPatternPathBool xp-100 yp+30 gPatternPathLock, Use pattern path: 
	Gui, Add, Edit, xp+100 yp-3 w100 h20 hwndPatternPath vVarPatternPath -Wrap -Multi, %A_ScriptDir%\input\patterns.txt
	Gui, Add, Button, xp+110 yp hwndSelectPatternFile gSelectPatternFileFunc -Wrap -Multi, Browse

	Gui, Add, CheckBox, hwndHoldBool vVarHoldBool xp-230 yp+30 Checked, Hold

Gui, Add, GroupBox, x320 y40 w260 h170, Output
	Gui, Add, Text, xp+10 yp+20, Log Path:
	Gui, Add, Edit, xp+80 yp-5 w100 h20 hwndLogPath vVarLogPath -Wrap -Multi, %A_ScriptDir%\output\last_output.txt
	Gui, Add, Button, xp+110 yp gSelectLogFileFunc -Wrap -Multi, Browse
	
	Gui, Add, Text, xp-190 yp+30, Output base:
	Gui, Add, Edit, xp+80 yp-5 w100 h20 hwndOutputBasePath vVarOutputBasePath -Wrap -Multi, %A_ScriptDir%\output\path.txt
	Gui, Add, Button, xp+110 yp hwndSelectOutputBaseFile gSelectOutputBaseFileFunc -Wrap -Multi, Browse
	
	Gui, Add, Button, xp-190 yp+30 gSubmitCommand h50 w50 -Wrap -Multi, Go
	
	Gui, Add, Button, xp+60 yp gLogfileCommand h50 w50 -Wrap -Multi, Logfile
	
	Gui, Add, Button, xp+60 yp gExplorerCommand h50 w50 -Wrap -Multi, Explorer
	
	Gui, Add, Button, xp+60 yp gFumenCommand h50 w50 -Wrap -Multi, Fumen



Gui, Add, GroupBox, x10 y220 w570 h170 hwndPercent, percent
	Gui, Add, Text, xp+10 yp+20 hwnd1Tc1, Clear Lines:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd1ClearLines vVar1ClearLines -Wrap -Multi, 4
	
	Gui, Add, Text, xp-120 yp+30 hwnd1Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd1Drop vVar1Drop w70, softdrop||harddrop|180|t-softdrop
	
	Gui, Add, Text, xp+190 yp-20 hwnd1Tt, Threads:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd1Threads vVar1Threads -Wrap -Multi, -1
	
	Gui, Add, Text, xp-120 yp+30 hwnd1Ttd, Tree depth:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd1TreeDepth vVar1TreeDepth -Wrap -Multi, 3
	
	Gui, Add, Text, xp-120 yp+30 hwnd1Tfc, Failed count:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd1FailedCount vVar1FailedCount -Wrap -Multi, 100

PercentGroup := [Percent, 1Tc1, 1ClearLines, 1Td, 1Drop, 1Tt, 1Threads, 1Ttd, 1TreeDepth, 1Tfc, 1FailedCount]
;GuiControlHideAll(PercentGroup*)

Gui, Add, GroupBox, x10 y220 w570 h170 hwndPath, path
	Gui, Add, Text, xp+10 yp+20 hwnd2Tc1, Clear Lines:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd2ClearLines vVar2ClearLines -Wrap -Multi, 4
	
	Gui, Add, Text, xp-120 yp+35 hwnd2Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd2Drop vVar2Drop w70, softdrop||harddrop|180|t-softdrop|any-tspin|tss|tsd|tst
	
	Gui, Add, Text, xp-120 yp+35 hwnd2Tt, Threads:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd2Threads vVar2Threads -Wrap -Multi, -1
	
	Gui, Add, CheckBox, hwndReservedBool vVar2ReservedBool xp-120 yp+30, Reserved
	
	Gui, Add, Text, xp+310 yp-85 hwnd2Tf, Format:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd2Format vVar2Format gFormatLock w70, html||csv
	
	Gui, Add, Text, hwnd2TKey xp-100 yp+30, Key: 
	Gui, Add, DropDownList, xp+100 yp-5 hwnd2Key vVar2Key w70, solution|pattern|use|none||
	
	Gui, Add, CheckBox, xp-120 yp+30 hwnd2Split vVar2Split w70, Split
	
	Gui, Add, Text, yp+25 hwnd2Tml, Max layer:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd2MaxLayer vVar2MaxLayer w70, 1|2||
	
	Gui, Add, CheckBox, xp-120 yp+30 hwnd2SpecifiedOnly vVar2SpecifiedOnly, Specified only
	Gui, Add, CheckBox, yp+20 hwnd2CachedBit vVar2CachedBit, Cached bit

PathGroup := [Path, 2Tc1, 2ClearLines, 2Td, 2Drop, 2Tt, 2Threads, ReservedBool, 2Tf, 2Format, 2TKey, 2Key, 2Split, 2Tml, 2MaxLayer, 2MaxLayer, 2SpecifiedOnly, 2CachedBit]
;GuiControlHideAll(PathGroup*)

Gui, Add, GroupBox, x10 y220 w570 h170 hwndSetup, setup
	Gui, Add, Text, xp+10 yp+20 hwnd3Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Drop vVar3Drop w70, softdrop||harddrop|180|t-softdrop
	
	Gui, Add, CheckBox, xp-120 yp+30 hwnd3Combination vVar3Combination, Combination
	
	Gui, Add, Text, yp+25 hwnd3Tfill, Fill:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Fill vVar3Fill w70, I|J|L|O|S|Z|T|none||
	
	Gui, Add, Text, xp-120 yp+30 hwnd3Tm, Margin:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Margin vVar3Margin w70, I|J|L|O|S|Z|T|none||
	
	Gui, Add, Text, xp-120 yp+30 hwnd3Tfree, Free:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Free vVar3Free w70, I|J|L|O|S|Z|T|none||
	
	Gui, Add, Text, xp-120 yp+30 hwnd3Tl, Line:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd3Line vVar3Line -Wrap -Multi, -1
	
	Gui, Add, Text, xp+190 yp-120 hwnd3Te, Exclude:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Exclude vVar3Exclude w70, holes|strict-holes|none||
	
	Gui, Add, Text, xp-120 yp+30 hwnd3To, Operate:
	Gui, Add, Edit, xp+120 yp-5 w100 h20 hwnd3Operate vVar3Operate -Wrap -Multi,
	
	Gui, Add, Text, xp-120 yp+30 hwnd3Tn, N-pieces:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd3NPieces vVar3NPieces -Wrap -Multi, -1
	
	Gui, Add, Text, xp-120 yp+40 hwnd3Tformat, Format:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Format vVar3Format w70, html||csv
	
	Gui, Add, CheckBox, xp-120 yp+30 hwnd3Split vVar3Split w70, Split
	
SetupGroup := [Setup, 3Td, 3Drop, 3Combination, 3Tfill, 3Fill, 3Tm, 3Margin, 3Tfree, 3Free, 3Tl, 3Line, 3Te, 3Exclude, 3To, 3Operate, 3Tn, 3NPieces, 3Tformat, 3Format, 3Split]
;GuiControlHideAll(SetupGroup*)

Gui, Add, GroupBox, x10 y220 w570 h170 hwndRen, ren
	Gui, Add, Text, xp+10 yp+20 hwnd4Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd4Drop vVar4Drop w70, softdrop||harddrop|180|t-softdrop
	
RenGroup := [Ren, 4Td, 4Drop]

;GuiControlHideAll(RenGroup*)

Gui, Add, GroupBox, x10 y220 w570 h170 hwndSpin, spin
	Gui, Add, Text, xp+10 yp+20 hwnd5Tl, Line:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd5Line vVar5Line -Wrap -Multi, 2
	
	Gui, Add, Text, xp-120 yp+30 hwnd5TFt, Fill top:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd5FillTop vVar5FillTop -Wrap -Multi, -1
	
	Gui, Add, Text, xp-120 yp+30 hwnd5TFb, Fill bottom:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd5FillBottom vVar5FillBottom -Wrap -Multi, 0
	
	Gui, Add, Text, xp-120 yp+30 hwnd5TMh, Margin height:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd5MarginHeight vVar5MarginHeight -Wrap -Multi, -1
	
	Gui, Add, CheckBox, xp-120 yp+30 hwnd5Roof vVar5Roof gRoofLock Checked, Roof
	
	Gui, Add, Text, xp+20 yp+20 hwnd5TMr, Max roof:
	Gui, Add, Edit, xp+100 yp-5 w40 h20 hwnd5MaxRoof vVar5MaxRoof -Wrap -Multi, -1
	
	Gui, Add, CheckBox, xp+190 yp-120 hwnd5Split vVar5Split w70, Split
	
	Gui, Add, Text, yp+25 hwnd5Tf, Filter:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd5Filter vVar5Filter w70, strict||ignore-t|none

SpinGroup := [Spin, 5Tl, 5Line, 5TFt, 5FillTop, 5TFb, 5FillBottom, 5TMh, 5MarginHeight, 5Roof, 5TMr, 5MaxRoof, 5Split, 5Tf, 5Filter]
;GuiControlHideAll(SpinGroup*)

Gui, Add, GroupBox, x10 y220 w570 h170 hwndCover, cover
	Gui, Add, Text, xp+10 yp+20 hwnd6Tm, Mode:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd6Mode vVar6Mode w70, normal||1L|2L|3L|4L|1L-OR-PC|2L-OR-PC|3L-OR-PC|4L-OR-PC|tetris|tetris-end|any-spin|tss|tsd|tst
	
	Gui, Add, Text, xp-120 yp+30 hwnd6TSb, Starting b2b:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd6StartingB2b vVar6StartingB2b -Wrap -Multi, 0
	
	Gui, Add, Text, xp-120 yp+30 hwnd6Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd6Drop vVar6Drop w70, softdrop||harddrop|180|t-softdrop|any-tspin|tss|tsd|tst
	
	Gui, Add, CheckBox, xp-120 yp+25 hwnd6Priority vVar6Priority w70, Priority
	
	Gui, Add, CheckBox, xp yp+25 hwnd6Mirror vVar6Mirror w70, Mirror
	
	Gui, Add, Text, xp+310 yp-95 hwnd6Tlsd, Last softdrop:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd6LastSoftDrop vVar6LastSoftDrop -Wrap -Multi, 0
	
	Gui, Add, Text, xp-120 yp+30 hwnd6Tmsd, Max softdrop:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd6MaxSoftDrop vVar6MaxSoftDrop -Wrap -Multi, -1
	
	Gui, Add, Text, xp-120 yp+30 hwnd6Tmcl, Max clear line:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd6MaxClearLine vVar6MaxClearLine -Wrap -Multi, -1
	
CoverGroup := [Cover, 6Tm, 6Mode, 6TSb, 6StartingB2b, 6Td, 6Drop, 6Priority, 6Mirror, 6Tlsd, 6LastSoftDrop, 6Tmsd, 6MaxSoftDrop, 6Tmcl, 6MaxClearLine]
;GuiControlHideAll(CoverGroup*)

global IntermediateGroups := [PercentGroup, PathGroup, SetupGroup, RenGroup, SpinGroup, CoverGroup]



Gosub, UpdateCommand
return


;#--------------------------------------------------------------------------------------------------#

FumenCommand: 
	Gui, Submit, NoHide
	Run, https://fumen.zui.jp/?%VarFumen%
return 

SubmitCommand:
	Gui, Submit, NoHide
	SubmitString := "java -jar sfinder.jar"
	if (VarChooseCommand = 1) {
		SubmitString .= " percent"
		SubmitString .= " -H" . (VarHoldBool ? " use" : " avoid")
		SubmitString .= (!VarFumenPathBool ? " -t " . VarFumen : " -fp """ . VarFumenPath . """" )
		SubmitString .= " -P " . VarPage
		SubmitString .= (!VarPatternPathBool ? " -p " . VarPattern : " -pp """ . VarPatternPath . """")
		
		SubmitString .= " -c " . Var1ClearLines
		SubmitString .= " -d " . Var1Drop
		SubmitString .= " -th " . Var1Threads
		SubmitString .= " -td " . Var1TreeDepth
		SubmitString .= " -fc " . Var1FailedCount
		
		SubmitString .= " -lp """ . VarLogPath . """"
	} else if (VarChooseCommand = 2) {
		SubmitString .= " path"
		SubmitString .= " -H" . (VarHoldBool ? " use" : " avoid")
		SubmitString .= (!VarFumenPathBool ? " -t " . VarFumen : " -fp """ . VarFumenPath . """" )
		SubmitString .= " -P " . VarPage
		SubmitString .= (!VarPatternPathBool ? " -p " . VarPattern : " -pp """ . VarPatternPath . """")
		
		SubmitString .= " -c " . Var1ClearLines
		SubmitString .= " -f " . Var2Format . (Var2Format="html" ? "" : " -k " . Var2Key)
		SubmitString .= " -s " . (Var2Split ? "yes" : "no")
		SubmitString .= " -L " . Var2MaxLayer
		SubmitString .= " -so " . (Var2SpecifiedOnly ? "yes" : "no")
		SubmitString .= " -r " . (Var2ReservedBool ? "true" : "false")
		SubmitString .= " -d " . Var2Drop
		SubmitString .= " -th " . Var2Threads
		SubmitString .= " -cb " . Var2CachedBit
		
		SubmitString .= " -o """ . VarOutputBasePath . """"
		SubmitString .= " -lp """ . VarLogPath . """"
	} else if (VarChooseCommand = 3) {
		SubmitString .= " setup"
		SubmitString .= " -H" . (VarHoldBool ? " use" : " avoid")
		SubmitString .= (!VarFumenPathBool ? " -t " . VarFumen : " -fp """ . VarFumenPath . """" )
		SubmitString .= " -P " . VarPage
		SubmitString .= (!VarPatternPathBool ? " -p " . VarPattern : " -pp """ . VarPatternPath . """")
		
		SubmitString .= " -c " . (Var3Combination ? "yes" : "no")
		SubmitString .= " -f " . Var3Fill
		SubmitString .= " -m " . Var3Margin
		SubmitString .= " -F " . Var3Free
		SubmitString .= " -l " . Var3Line
		SubmitString .= " -d " . Var3Drop
		SubmitString .= " -e " . Var3Exclude
		SubmitString .= " -op " . Var3Operate
		SubmitString .= " -np " . Var3NPieces
		SubmitString .= " -fo " . Var3Format
		SubmitString .= " -s " . Var3Split
		
		SubmitString .= " -o """ . VarOutputBasePath . """"
		SubmitString .= " -lp """ . VarLogPath . """"
	} else if (VarChooseCommand = 4) {
		SubmitString .= " ren"
		SubmitString .= " -H" . (VarHoldBool ? " use" : " avoid")
		SubmitString .= (!VarFumenPathBool ? " -t " . VarFumen : " -fp """ . VarFumenPath . """" )
		SubmitString .= " -P " . VarPage
		SubmitString .= (!VarPatternPathBool ? " -p " . VarPattern : " -pp """ . VarPatternPath . """")
		
		SubmitString .= " -d " . Var4Drop
		
		SubmitString .= " -o """ . VarOutputBasePath . """"
		SubmitString .= " -lp """ . VarLogPath . """"
	} else if (VarChooseCommand = 5) {
		SubmitString .= " spin"
		SubmitString .= (!VarFumenPathBool ? " -t " . VarFumen : " -fp """ . VarFumenPath . """" )
		SubmitString .= " -P " . VarPage
		SubmitString .= (!VarPatternPathBool ? " -p " . VarPattern : " -pp """ . VarPatternPath . """")
		
		SubmitString .= " -ft " . Var5FillTop
		SubmitString .= " -fb " . Var5FillBottom
		SubmitString .= " -m " . Var5MarginHeight
		SubmitString .= " -c " . Var5Line
		SubmitString .= " -r " . (Var5Roof ? "yes -mr " . Var5MaxRoof : "no")
		SubmitString .= " -s " . (Var5Split ? "yes" : "no")
		SubmitString .= " -f " . Var5Filter
		
		SubmitString .= " -o """ . VarOutputBasePath . """"
		SubmitString .= " -lp """ . VarLogPath . """"
	} else if (VarChooseCommand = 6) {
		SubmitString .= " cover"
		SubmitString .= " -H" . (VarHoldBool ? " use" : " avoid")
		SubmitString .= (!VarFumenPathBool ? " -t " . VarFumen : " -fp """ . VarFumenPath . """" )
		SubmitString .= "#" . VarPage
		SubmitString .= (!VarPatternPathBool ? " -p " . VarPattern : " -pp """ . VarPatternPath . """")
		
		SubmitString .= " -d " . Var6Drop
		SubmitString .= " -m " . (Var6Mirror ? "yes" : "no")
		SubmitString .= " -M " . Var6Mode
		SubmitString .= " -sb " . Var6StartingB2b
		SubmitString .= " -P " . (Var6Priority ? "yes" : "no")
		SubmitString .= " -l " . Var6LastSoftDrop
		SubmitString .= " -ms " . Var6MaxSoftDrop
		SubmitString .= " -mc " . Var6MaxClearLine
		
		SubmitString .= " -o """ . VarOutputBasePath . """"
		SubmitString .= " -lp """ . VarLogPath . """"
	}
	Run cmd.exe /c %SubmitString%
return

LogfileCommand:
	Gui, Submit, NoHide
	ExplorerPath := VarLogPath
	;MsgBox, %ExplorerPath%
	Run, explorer %ExplorerPath%
return

ExplorerCommand:
	Gui, Submit, NoHide
	Run, explorer %A_ScriptDir%
return

UpdateCommand: 
	Gui, Submit, NoHide
	for group in IntermediateGroups {
		GuiControlHideAll(IntermediateGroups[group]*)
	}
	GuiControlShowAll(IntermediateGroups[VarChooseCommand]*) ;show menu of the one in selection
	
	;bool := (VarChooseCommand = 6) ;PageLock ;nvm cover still uses pages, just different implementation
	;LockerFunction(bool, Page)
	
	Gosub, FumenPathLock
	Gosub, PatternPathLock
	GoSub, FormatLock
	GoSub, RoofLock
	GoSub, OutputBaseLock
	GoSub, HoldLock
return

FumenPathLock:
	Gui, Submit, NoHide
	LockerFunction(VarFumenPathBool, Fumen)
	LockerFunction(!VarFumenPathBool, SelectFumenFile)
	LockerFunction(!VarFumenPathBool, FumenPath)
return

HoldLock:
	Gui, Submit, NoHide
	bool := (VarChooseCommand = 5)
	LockerFunction(bool, HoldBool)
return

PatternPathLock:
	Gui, Submit, NoHide
	bool := (VarChooseCommand = 5)
	LockerFunction(false or VarPatternPathBool, Pattern)
	LockerFunction(false or !VarPatternPathBool, PatternPath)
	LockerFunction(false, PatternPathBool)
	LockerFunction(false or !VarPatternPathBool, SelectPatternFile)
return

OutputBaseLock:
	Gui, Submit, NoHide
	bool := (VarChooseCommand = 1)
	LockerFunction(bool, OutputBasePath)
	LockerFunction(bool, SelectOutputBaseFile)
return

FormatLock:
	Gui, Submit, NoHide
	LockerFunction(Var2Format != "csv", 2Key)
return

RoofLock:
	Gui, Submit, NoHide
	LockerFunction(!Var5Roof, 5MaxRoof)
return

LockerFunction(condition, LockTarget) {
	if (condition) {
		GuiControl, Disable, %LockTarget%
	} else {
		GuiControl, Enable, %LockTarget%
	}
}

SelectFumenFileFunc: ;might not work
	SelectFile(FumenPath)
return

SelectPatternFileFunc:
	SelectFile(PatternPath)
return

SelectLogFileFunc:
	SelectFile(LogPath)
return

SelectOutputBaseFileFunc:
	SelectFile(OutputBasePath)
return

SelectFile(boxID){
	Gui, Submit, NoHide
	FileSelectFile, FilePath, s, Filename,, *.txt
	GuiControl,, %boxID%, %FilePath%
}

GuiControlHideAll(controls*) {
  For i, control In controls {
    GuiControl, Hide, %control%
  }
}

GuiControlShowAll(controls*) {
  For i, control In controls {
    GuiControl, Show, %control%
  }
}



^Esc:: ExitApp