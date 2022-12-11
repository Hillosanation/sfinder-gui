#SingleInstance, Force

SetTitleMatchMode, 2

WinActivate, "sfinder gui but extended"

Gui, GUIWindow:New
Gui, Show, w600 h420
Gui, Add, Text, y10, Command type:
Gui, Add, DropDownList, vVarChooseCommand AltSubmit w70 x90 yp-4 gUpdateCommand, percent||path|setup|ren|spin|cover

Gui, Add, GroupBox, x10 y30 w300 h200, Inputs
	InputAlign1 := 20
	InputAlign1a := InputAlign1 + 20
	InputAlign2 := InputAlign1 + 120
	InputAlign1z := InputAlign1 + 100
	InputAlign3 := InputAlign2 + 110
	Gui, Add, Text, x%InputAlign1% yp+20, Fumen:
	Gui, Add, Edit, x%InputAlign2% yp-5 w100 h20 hwndFumen vVarFumen -Wrap -Multi, v115@9gC8EeE8DeF8CeG8DeC8JeAgH

	Gui, Add, CheckBox, x%InputAlign1a% yp+30 hwndFumenPathBool vVarFumenPathBool gFumenPathLock, Use fumen path:
	Gui, Add, Edit, x%InputAlign2% yp-3 w100 h20 hwndFumenPath vVarFumenPath -Wrap -Multi, %A_ScriptDir%\input\field.txt
	Gui, Add, Button, x%InputAlign3% yp hwndSelectFumenFile gSelectFumenFileFunc -Wrap -Multi, Browse

	Gui, Add, Text, x%InputAlign1% yp+30, Page:
	Gui, Add, Edit, x%InputAlign2% yp-5 w40 hwndPage vVarPage -Wrap -Multi, 1

	Gui, Add, Text, x%InputAlign1% yp+30, Pattern:
	Gui, Add, Edit, x%InputAlign2% yp-5 w100 hwndPattern vVarPattern -Wrap -Multi, I,[IJLOSTZ]p3,

	Gui, Add, CheckBox, x%InputAlign1a% yp+30 hwndPatternPathBool vVarPatternPathBool gPatternPathLock, Use pattern path:
	Gui, Add, Edit, x%InputAlign2% yp-3 w100 h20 hwndPatternPath vVarPatternPath -Wrap -Multi, %A_ScriptDir%\input\patterns.txt
	Gui, Add, Button, x%InputAlign3% yp hwndSelectPatternFile gSelectPatternFileFunc -Wrap -Multi, Browse

	Gui, Add, CheckBox, x%InputAlign1% yp+30 hwndHoldBool vVarHoldBool Checked, Hold

	Gui, Add, Text, x%InputAlign1% yp+20 hwndTKick1, Kick:
	Gui, Add, Text, x%InputAlign1z% yp hwndTKick2, @
	Gui, Add, Edit, x%InputAlign2% yp-5 w100 hwndKick vVarKick, srs
	Gui, Add, Button, xp+110 yp -Wrap -Multi hwndSelectKick gSelectKickFunc, Browse

Gui, Add, GroupBox, x320 y30 w260 h200, Output
	Gui, Add, CheckBox, hwndTLP vVarLogPathBool xp+10 yp+20 gLogPathLock, Log Path:
	Gui, Add, Edit, xp+80 yp-5 w100 h20 hwndLogPath vVarLogPath -Wrap -Multi, %A_ScriptDir%\output\last_output.txt
	Gui, Add, Button, xp+110 yp hwndSelectLogPathFile gSelectLogFileFunc -Wrap -Multi, Browse

	Gui, Add, CheckBox, hwndTOB vVarOutputBaseBool xp-190 yp+30 gOutputBaseLock, Output base:
	Gui, Add, Edit, xp+80 yp-5 w100 h20 hwndOutputBasePath vVarOutputBasePath -Wrap -Multi, %A_ScriptDir%\output\path.txt
	Gui, Add, Button, xp+110 yp hwndSelectOutputBaseFile gSelectOutputBaseFileFunc -Wrap -Multi, Browse

	Gui, Add, Button, xp-190 yp+30 gSubmitCommand h50 w50 -Wrap -Multi, Go

	Gui, Add, Button, xp+60 yp gLogfileCommand h50 w50 -Wrap -Multi, Logfile

	Gui, Add, Button, xp+60 yp gExplorerCommand h50 w50 -Wrap -Multi, Explorer

	Gui, Add, Button, xp+60 yp gFumenCommand h50 w50 -Wrap -Multi, Fumen

	Gui, Add, Edit, xp-180 yp+60 hwndOutputCommandDisplay vVarOutputCommandDisplay


Gui, Add, GroupBox, x10 y240 w570 h170 hwndPercent, percent
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

Gui, Add, GroupBox, x10 y240 w570 h170 hwndPath, path
	Gui, Add, Text, xp+10 yp+20 hwnd2Tc1, Clear Lines:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd2ClearLines vVar2ClearLines -Wrap -Multi, 4

	Gui, Add, Text, xp-120 yp+35 hwnd2Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd2Drop vVar2Drop w70, softdrop||harddrop|180|t-softdrop|tsz|tsm|tss|tsd|tst

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

	Gui, Add, Text, yp+25 hwnd2Tcb, Cached bit:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd2CachedBit vVar2CachedBit -Wrap -Multi, 0

PathGroup := [Path, 2Tc1, 2ClearLines, 2Td, 2Drop, 2Tt, 2Threads, ReservedBool, 2Tf, 2Format, 2TKey, 2Key, 2Split, 2Tml, 2MaxLayer, 2MaxLayer, 2SpecifiedOnly, 2Tcb, 2CachedBit]
;GuiControlHideAll(PathGroup*)

Gui, Add, GroupBox, x10 y240 w570 h170 hwndSetup, setup
	SetupAlign1 := 20
	SetupAlign2 := 140
	Gui, Add, Text, x%SetupAlign1% yp+20 hwnd3Td, Drop:
	Gui, Add, DropDownList, x%SetupAlign2% yp-5 hwnd3Drop vVar3Drop w70, softdrop||harddrop|180|t-softdrop

	Gui, Add, CheckBox, x%SetupAlign1% yp+30 hwnd3Combination vVar3Combination, Combination

	Gui, Add, Text, x%SetupAlign2% yp+15 w12 Center hwnd3TpiecenamesI, I
	Gui, Add, Text, xp+24                w12 Center hwnd3TpiecenamesJ, J
	Gui, Add, Text, xp+24                w12 Center hwnd3TpiecenamesL, L
	Gui, Add, Text, xp+24                w12 Center hwnd3TpiecenamesO, O
	Gui, Add, Text, xp+24                w12 Center hwnd3TpiecenamesS, S
	Gui, Add, Text, xp+24                w12 Center hwnd3TpiecenamesZ, Z
	Gui, Add, Text, xp+24                w12 Center hwnd3TpiecenamesT, T

	Gui, Add, Text, x%SetupAlign1% yp+15 hwnd3Tfill, Fill:
	Gui, Add, CheckBox, x%SetupAlign2% yp+0 hwnd3FillI vVar3FillI w24
	Gui, Add, CheckBox, xp+24               hwnd3FillJ vVar3FillJ w24
	Gui, Add, CheckBox, xp+24               hwnd3FillL vVar3FillL w24
	Gui, Add, CheckBox, xp+24               hwnd3FillO vVar3FillO w24
	Gui, Add, CheckBox, xp+24               hwnd3FillS vVar3FillS w24
	Gui, Add, CheckBox, xp+24               hwnd3FillZ vVar3FillZ w24
	Gui, Add, CheckBox, xp+24               hwnd3FillT vVar3FillT w24

	Gui, Add, Text, x%SetupAlign1% yp+20 hwnd3Tm, Margin:
	Gui, Add, CheckBox, x%SetupAlign2% yp+0 hwnd3MarginI vVar3MarginI w24
	Gui, Add, CheckBox, xp+24               hwnd3MarginJ vVar3MarginJ w24
	Gui, Add, CheckBox, xp+24               hwnd3MarginL vVar3MarginL w24
	Gui, Add, CheckBox, xp+24               hwnd3MarginO vVar3MarginO w24
	Gui, Add, CheckBox, xp+24               hwnd3MarginS vVar3MarginS w24
	Gui, Add, CheckBox, xp+24               hwnd3MarginZ vVar3MarginZ w24
	Gui, Add, CheckBox, xp+24               hwnd3MarginT vVar3MarginT w24

	Gui, Add, Text, x%SetupAlign1% yp+20 hwnd3Tfree, Free:
	Gui, Add, CheckBox, x%SetupAlign2% yp+0 hwnd3FreeI vVar3FreeI w24
	Gui, Add, CheckBox, xp+24               hwnd3FreeJ vVar3FreeJ w24
	Gui, Add, CheckBox, xp+24               hwnd3FreeL vVar3FreeL w24
	Gui, Add, CheckBox, xp+24               hwnd3FreeO vVar3FreeO w24
	Gui, Add, CheckBox, xp+24               hwnd3FreeS vVar3FreeS w24
	Gui, Add, CheckBox, xp+24               hwnd3FreeZ vVar3FreeZ w24
	Gui, Add, CheckBox, xp+24               hwnd3FreeT vVar3FreeT w24

	Gui, Add, Text, x%SetupAlign1% yp+30 hwnd3Tl, Line:
	Gui, Add, Edit, x%SetupAlign2% yp-5 w40 h20 hwnd3Line vVar3Line -Wrap -Multi, -1

	Gui, Add, Text, xp+190 yp-120 hwnd3Te, Exclude:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Exclude vVar3Exclude w70, holes|strict-holes|none||

	Gui, Add, Text, xp-120 yp+30 hwnd3To, Operate:
	Gui, Add, Edit, xp+120 yp-5 w100 h20 hwnd3Operate vVar3Operate -Wrap -Multi,

	Gui, Add, Text, xp-120 yp+30 hwnd3Tn, N-pieces:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd3NPieces vVar3NPieces -Wrap -Multi, -1

	Gui, Add, Text, xp-120 yp+40 hwnd3Tformat, Format:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd3Format vVar3Format w70, html||csv

	Gui, Add, CheckBox, xp-120 yp+30 hwnd3Split vVar3Split w70, Split

SetupGroup := [Setup, 3Td, 3Drop, 3Combination, 3TpiecenamesI, 3TpiecenamesJ, 3TpiecenamesL, 3TpiecenamesO, 3TpiecenamesS, 3TpiecenamesZ, 3TpiecenamesT, 3Tfill, 3FillI, 3FillJ, 3FillL, 3FillO, 3FillS, 3FillZ, 3FillT, 3Tm, 3MarginI, 3MarginJ, 3MarginL, 3MarginO, 3MarginS, 3MarginZ, 3MarginT, 3Tfree, 3FreeI, 3FreeJ, 3FreeL, 3FreeO, 3FreeS, 3FreeZ, 3FreeT, 3Tl, 3Line, 3Te, 3Exclude, 3To, 3Operate, 3Tn, 3NPieces, 3Tformat, 3Format, 3Split]
;GuiControlHideAll(SetupGroup*)

Gui, Add, GroupBox, x10 y240 w570 h170 hwndRen, ren
	Gui, Add, Text, xp+10 yp+20 hwnd4Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd4Drop vVar4Drop w70, softdrop||harddrop|180|t-softdrop

RenGroup := [Ren, 4Td, 4Drop]

;GuiControlHideAll(RenGroup*)

Gui, Add, GroupBox, x10 y240 w570 h170 hwndSpin, spin
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

	Gui, Add, Text, xp-120 yp+30 hwnd5Tformat, Format:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd5Format vVar5Format w70, html||csv

SpinGroup := [Spin, 5Tl, 5Line, 5TFt, 5FillTop, 5TFb, 5FillBottom, 5TMh, 5MarginHeight, 5Roof, 5TMr, 5MaxRoof, 5Split, 5Tf, 5Filter, 5Tformat, 5Format]
;GuiControlHideAll(SpinGroup*)

Gui, Add, GroupBox, x10 y240 w570 h170 hwndCover, cover
	Gui, Add, Text, xp+10 yp+20 hwnd6Tm, Mode:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd6Mode vVar6Mode w70, normal||1L|2L|3L|4L|1L-OR-PC|2L-OR-PC|3L-OR-PC|4L-OR-PC|tetris|tetris-end|tsm|tss|tsd|tst

	Gui, Add, Text, xp-120 yp+30 hwnd6TSb, Starting b2b:
	Gui, Add, Edit, xp+120 yp-5 w40 h20 hwnd6StartingB2b vVar6StartingB2b -Wrap -Multi, 0

	Gui, Add, Text, xp-120 yp+30 hwnd6Td, Drop:
	Gui, Add, DropDownList, xp+120 yp-5 hwnd6Drop vVar6Drop w70, softdrop||harddrop|180|t-softdrop|tsz|tsm|tss|tsd|tst

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

IntermediateGroups := [PercentGroup, PathGroup, SetupGroup, RenGroup, SpinGroup, CoverGroup]



UpdateCommand()
return


;#--------------------------------------------------------------------------------------------------#

FumenCommand() {
	Gui, Submit, NoHide
	global VarFumen
	Run, https://fumen.zui.jp/?%VarFumen%
}

SubmitCommand() {
	global
	Gui, Submit, NoHide
	local SubmitString := "java -jar sfinder.jar"

	;common inputs - mostly the same for all commands
	local CommonSettings := ""
	if (VarChooseCommand != 5) {
		CommonSettings .= " -H" . (VarHoldBool ? " use" : " avoid")
	}
	CommonSettings .= (!VarFumenPathBool ? " -t " . VarFumen : " -fp """ . VarFumenPath . """" )
	if (VarChooseCommand != 6) {
		CommonSettings .= " -P " . VarPage
	}
	CommonSettings .= (!VarPatternPathBool ? " -p " . VarPattern : " -pp """ . VarPatternPath . """")

	if (VarChooseCommand != 1 and VarOutputBaseBool) {
		CommonSettings .= " -o """ . VarOutputBasePath . """"
	}
	if (VarLogPathBool) {
		CommonSettings .= " -lp """ . VarLogPath . """"
	}
	if (VarChooseCommand != 5) {
		CommonSettings .= " -K ""@" . VarKick . """"
	}

	;respective settings - all taken from different inputs
	if (VarChooseCommand = 1) {
		SubmitString .= " percent"

		SubmitString .= CommonSettings

		SubmitString .= " -c " . Var1ClearLines
		SubmitString .= " -d " . Var1Drop
		SubmitString .= " -th " . Var1Threads
		SubmitString .= " -td " . Var1TreeDepth
		SubmitString .= " -fc " . Var1FailedCount
	} else if (VarChooseCommand = 2) {
		SubmitString .= " path"

		SubmitString .= CommonSettings

		SubmitString .= " -c " . Var2ClearLines
		SubmitString .= " -f " . Var2Format . (Var2Format="html" ? "" : " -k " . Var2Key)
		SubmitString .= " -s " . (Var2Split ? "yes" : "no")
		SubmitString .= " -L " . Var2MaxLayer
		SubmitString .= " -so " . (Var2SpecifiedOnly ? "yes" : "no")
		SubmitString .= " -r " . (Var2ReservedBool ? "true" : "false")
		SubmitString .= " -d " . Var2Drop
		SubmitString .= " -th " . Var2Threads
		SubmitString .= " -cb " . Var2CachedBit
	} else if (VarChooseCommand = 3) {
		SubmitString .= " setup"

		SubmitString .= CommonSettings

		SubmitString .= " -c " . (Var3Combination ? "yes" : "no")

		SelectedTetrominos := ""
		local CorrespondingTetromino := ["I", "J", "L", "O", "S", "Z", "T"]
		local FillChoose := [Var3FillI, Var3FillJ, Var3FillL, Var3FillO, Var3FillS, Var3FillZ, Var3FillT]
		local MarginChoose := [Var3MarginI, Var3MarginJ, Var3MarginL, Var3MarginO, Var3MarginS, Var3MarginZ, Var3MarginT]
		local FreeChoose := [Var3FreeI, Var3FreeJ, Var3FreeL, Var3FreeO, Var3FreeS, Var3FreeZ, Var3FreeT]

		For option, optionFlag in {FillChoose: " -f ", MarginChoose: " -m ", FreeChoose: " -F "} {
			;MsgBox, %option%
			optionString := ""
			For index, pieceChosen in %option% {
				if (pieceChosen) {
					optionString .= CorrespondingTetromino[index]
				}
				;MsgBox, %optionString%
			}
			if (optionString = "") {
				optionString := "none"
			}

			SubmitString .= optionFlag . optionString
		}


		SubmitString .= " -l "  . Var3Line
		SubmitString .= " -d "  . Var3Drop
		SubmitString .= " -e "  . Var3Exclude
		SubmitString .= " -op " . Var3Operate
		SubmitString .= " -np " . Var3NPieces
		SubmitString .= " -fo " . Var3Format
		SubmitString .= " -s "  . (Var3Split ? "yes" : "no")
	} else if (VarChooseCommand = 4) {
		SubmitString .= " ren"

		SubmitString .= CommonSettings

		SubmitString .= " -d " . Var4Drop
	} else if (VarChooseCommand = 5) {
		SubmitString .= " spin"

		SubmitString .= CommonSettings

		SubmitString .= " -ft " . Var5FillTop
		SubmitString .= " -fb " . Var5FillBottom
		SubmitString .= " -m " . Var5MarginHeight
		SubmitString .= " -c " . Var5Line
		SubmitString .= " -r " . (Var5Roof ? "yes -mr " . Var5MaxRoof : "no")
		SubmitString .= " -s " . (Var5Split ? "yes" : "no")
		SubmitString .= " -f " . Var5Filter
		SubmitString .= " -fo " . Var5Format
	} else if (VarChooseCommand = 6) {
		SubmitString .= " cover"

		SubmitString .= CommonSettings

		SubmitString .= " -d " . Var6Drop
		SubmitString .= " -m " . (Var6Mirror ? "yes" : "no")
		SubmitString .= " -M " . Var6Mode
		SubmitString .= " -sb " . Var6StartingB2b
		SubmitString .= " -P " . (Var6Priority ? "yes" : "no")
		SubmitString .= " -l " . Var6LastSoftDrop
		SubmitString .= " -ms " . Var6MaxSoftDrop
		SubmitString .= " -mc " . Var6MaxClearLine
	}
	GuiControl,, %OutputCommandDisplay%, %SubmitString%
	Run cmd.exe /c %SubmitString%
	;MsgBox, %SubmitString% ;testing
}

LogfileCommand() {
	Gui, Submit, NoHide
	global VarLogPath
	Run, explorer %VarLogPath%
}

ExplorerCommand() {
	Gui, Submit, NoHide
	Run, explorer %A_ScriptDir%
}

UpdateCommand() {
	global
	Gui, Submit, NoHide
	for group in IntermediateGroups {
		GuiControlHideAll(IntermediateGroups[group]*)
	}
	GuiControlShowAll(IntermediateGroups[VarChooseCommand]*) ;show menu of the one in selection

	FumenPathLock()
	PatternPathLock()
	FormatLock()
	RoofLock()
	OutputBaseLock()
	HoldLock()
	LogPathLock()
	KickLock()
}

FumenPathLock() {
	global
	Gui, Submit, NoHide
	LockerFunction(VarFumenPathBool, Fumen)
	LockerFunction(!VarFumenPathBool, SelectFumenFile)
	LockerFunction(!VarFumenPathBool, FumenPath)
}

HoldLock() {
	global
	Gui, Submit, NoHide
	local bool := (VarChooseCommand = 5)
	LockerFunction(bool, HoldBool)
}

PatternPathLock() {
	global
	Gui, Submit, NoHide
	local bool := (VarChooseCommand = 5)
	LockerFunction(false or VarPatternPathBool, Pattern)
	LockerFunction(false or !VarPatternPathBool, PatternPath)
	LockerFunction(false, PatternPathBool)
	LockerFunction(false or !VarPatternPathBool, SelectPatternFile)
}

LogPathLock() {
	global
	Gui, Submit, NoHide
	LockerFunction(!VarLogPathBool, LogPath)
	LockerFunction(!VarLogPathBool, SelectLogPathFile)
}

OutputBaseLock() {
	global
	Gui, Submit, NoHide
	local bool := (VarChooseCommand = 1)
	LockerFunction(bool or !VarOutputBaseBool, OutputBasePath)
	LockerFunction(bool or !VarOutputBaseBool, SelectOutputBaseFile)
}

KickLock() {
	global
	Gui, Submit, NoHide
	local bool := (VarChooseCommand = 5)
	LockerFunction(bool, Kick)
	LockerFunction(bool, SelectKick)
}

FormatLock() {
	global
	Gui, Submit, NoHide
	LockerFunction(Var2Format != "csv", 2Key)
}

RoofLock() {
	global
	Gui, Submit, NoHide
	LockerFunction(!Var5Roof, 5MaxRoof)
}

LockerFunction(condition, LockTarget) {
	if (condition) {
		GuiControl, Disable, %LockTarget%
	} else {
		GuiControl, Enable, %LockTarget%
	}
}

SelectFumenFileFunc() {
	global FumenPath
	SelectFile(FumenPath)
}

SelectPatternFileFunc() {
	global PatternPath
	SelectFile(PatternPath)
}

SelectLogFileFunc() {
	global LogPath
	SelectFile(LogPath)
}

SelectOutputBaseFileFunc() {
	global OutputBasePath
	SelectFile(OutputBasePath)
}

SelectKickFunc() {
	global Kick
	Gui, Submit, NoHide
	KickDir := A_ScriptDir . "\kicks"
	FileSelectFile, FilePath, s, %KickDir%,, *.properties
	RegExMatch(FilePath, "\w+(?=\.properties)", FileName)
	;MsgBox % FileName
	GuiControl,, %Kick%, %FileName%
}

SelectFile(boxID){
	Gui, Submit, NoHide
	FileSelectFile, FilePath, s, %A_ScriptDir%,, *.txt
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
GuiClose() {
	ExitApp
}