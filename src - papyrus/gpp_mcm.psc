Scriptname gpp_mcm extends SKI_ConfigBase

import Input
import StringUtil
import Utility

gpp_mcm_gen property gen auto
gpp_mcm_act property act auto
gpp_mcm_C1 property C1 auto
gpp_mcm_C2 property C2 auto
gpp_mcm_C3 property C3 auto
gpp_mcm_C4 property C4 auto
gpp_mcm_inf property inf auto
gpp_keyhandler property KH auto

string sCurrentPage

string property MCMSettingsPath = "Data/Gamepad++/Presets/" autoReadOnly
string property FileExt = ".gpp" autoReadonly

bool bBusy
bool property bUpdateKeys auto hidden

; ###########################
; ### MCM Version Control ###

int function GetVersion()
    return 1
endFunction

;/event OnVersionUpdate(int a_version)
    if (a_version >= 1 && CurrentVersion < 1)
        Debug.Notification("$IEQ_MCM_not_Updating" + " " + a_version as string)
        OnConfigInit()
    endIf
endEvent/;

; #############################
; ### MCM Internal Settings ###

event OnConfigInit()
    Pages = new String[8]
    Pages[0] = "$gpp_mcm_lbl_gen"
    Pages[1] = "$gpp_mcm_lbl_act"
    Pages[2] = "$gpp_mcm_lbl_com1"
    Pages[3] = "$gpp_mcm_lbl_com2"
    Pages[4] = "$gpp_mcm_lbl_com3"
    Pages[5] = "$gpp_mcm_lbl_com4"
    Pages[6] = "$gpp_mcm_lbl_inf"
    Pages[7] = "$gpp_mcm_lbl_ctrls"

    gen.initData()
    act.initData()
    C1.initData()
    C2.initData()
    C3.initData()
    C4.initData()
    inf.initData()          

    RegisterForKey(KH.GPP_HOTKEY_TIM)
endEvent

Event OnKeyDown(Int KeyCode)
    if KeyCode == KH.GPP_HOTKEY_TIM
        ;ToggleInputMode() ; when ever the key is pressed will only work in menu mode
    endif
EndEvent

Event OnConfigClose()
    UnregisterForKey(KH.GPP_HOTKEY_TIM)
    if bUpdateKeys
    	bUpdateKeys = false
    	KH.RegisterKeys()
    endIf
endEvent

function updateSettings()

endFunction

; #################
; ### MCM Pages ###

event OnPageReset(string page)
    SetCursorFillMode(TOP_TO_BOTTOM)
    sCurrentPage = page
    
    if page == ""
        LoadCustomContent("GPP/GPP_Splash.dds", 70, 55)
    elseIf page == "$gpp_mcm_lbl_ctrls"
        LoadCustomContent("GPP/GPP_Controls.dds", 28, 22)
    else
        UnloadCustomContent()
    
		if page == "$gpp_mcm_lbl_gen"
			gen.drawPage()
		elseIf page == "$gpp_mcm_lbl_act" 
			act.drawPage()
        elseIf page == "$gpp_mcm_lbl_C1" 
            C1.drawPage()
        elseIf page == "$gpp_mcm_lbl_C2" 
            C2.drawPage()
        elseIf page == "$gpp_mcm_lbl_C3" 
            C3.drawPage()
        elseIf page == "$gpp_mcm_lbl_C4" 
            C4.drawPage()
		elseIf page == "$gpp_mcm_lbl_inf" 
			inf.drawPage()
		endIf
    endif
endEvent

function jumpToPage(string eventName, float tmpVar = -1.0, string tmpStr = "")
    string sCurrentState = GetState()
    
    if sCurrentPage == "$gpp_mcm_lbl_gen"
        gen.jumpToState(sCurrentState, eventName, tmpVar)
    elseIf sCurrentPage == "$gpp_mcm_lbl_act"
        act.jumpToState(sCurrentState, eventName, tmpVar)
    elseIf sCurrentPage == "$gpp_mcm_lbl_C1"
        C1.jumpToState(sCurrentState, eventName, tmpVar)
    elseIf sCurrentPage == "$gpp_mcm_lbl_C2"
        C2.jumpToState(sCurrentState, eventName, tmpVar)
    elseIf sCurrentPage == "$gpp_mcm_lbl_C3"
        C3.jumpToState(sCurrentState, eventName, tmpVar)
    elseIf sCurrentPage == "$gpp_mcm_lbl_C4"
        C4.jumpToState(sCurrentState, eventName, tmpVar)
    elseIf sCurrentPage == "$gpp_mcm_lbl_inf"
        inf.jumpToState(sCurrentState, eventName, tmpVar, tmpStr)
    endIf
endFunction


; #######################
; ### START OF EVENTS ###

; GENERAL

event OnHighlightST()
    jumpToPage("Highlight")
endEvent

event OnSelectST()
    jumpToPage("Select")
endEvent

event OnDefaultST()
    jumpToPage("Default")
endEvent

; SLIDERS

event OnSliderOpenST()
    jumpToPage("Open")
endEvent

event OnSliderAcceptST(float value)
    jumpToPage("Accept", value)
endEvent

; MENUS

event OnMenuOpenST()
    jumpToPage("Open")
endEvent
    
event OnMenuAcceptST(int index)
    jumpToPage("Accept", index)
endEvent

; COLORS

event OnColorOpenST()
    jumpToPage("Open")
endEvent
    
event OnColorAcceptST(int color)
    jumpToPage("Accept", color)
endEvent

; HOTKEYS

event OnKeyMapChangeST(int keyCode, string conflictControl, string conflictName)
    if (conflictControl != "" && keyCode != -1) ; CHECK IF THIS IS ACTUALLY WORKING
        string msg
        
        if (conflictName != "")
            ;msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n(" + conflictName + ")\n\nAre you sure you want to continue?"
            msg = "$gpp_mcm_msg_AlreadyMapped1{" + conflictControl + "}{" + conflictName + "}"
        else
            ;msg = "This key is already mapped to:\n\"" + conflictControl + "\"\n\nAre you sure you want to continue?"
            msg = "$gpp_mcm_msg_AlreadyMapped2{" + conflictControl + "}"
        endIf
        
        if ShowMessage(msg, true, "$Yes", "$No")
            jumpToPage("Change", keyCode)
        endIf
    else
        jumpToPage("Change", keyCode)
    endIf
endEvent

; INPUT

event OnInputOpenST()
	jumpToPage("Open")
endEvent

event OnInputAcceptST(string sInput)
    jumpToPage("Accept", -1.0, sInput)
endEvent

; #################
; ### MCM TOOLS ###

function savePreset(string presetName)	; Save data to JContainer file
	int jMCMPreset = jMap.object()
	
	jMap.setInt(jMCMPreset, "Version", GetVersion())
	jMap.setObj(jMCMPreset, "General", gen.saveData())
	jMap.setObj(jMCMPreset, "Actions", act.saveData())
    jMap.setObj(jMCMPreset, "Combo1", C1.saveData())
    jMap.setObj(jMCMPreset, "Combo2", C2.saveData())
    jMap.setObj(jMCMPreset, "Combo3", C3.saveData())
    jMap.setObj(jMCMPreset, "Combo4", C4.saveData())
	
	jValue.writeTofile(jMCMPreset, MCMSettingsPath + presetName + FileExt)
	jValue.zeroLifetime(jMCMPreset)
endFunction

function loadPreset(string presetName, bool bNoExt = false)	; Load MCM data
	if (bBusy)
		ShowMessage("$gpp_common_LoadPresetBusy")
	else
		int jMCMPreset
		
		if (bNoExt)
			jMCMPreset = jValue.readFromFile(MCMSettingsPath + presetName)
		else
			jMCMPreset = jValue.readFromFile(MCMSettingsPath + presetName + FileExt)
		endIf
		
		if (jMap.getInt(jMCMPreset, "Version") != GetVersion())
			ShowMessage("$gpp_common_LoadPresetError")
		else
			bBusy = true
			
			gen.loadData(jMap.getObj(jMCMPreset, "General"))
			act.loadData(jMap.getObj(jMCMPreset, "Actions"))
            C1.loadData(jMap.getObj(jMCMPreset, "Combo1"))
            C2.loadData(jMap.getObj(jMCMPreset, "Combo2"))
            C3.loadData(jMap.getObj(jMCMPreset, "Combo3"))
            C4.loadData(jMap.getObj(jMCMPreset, "Combo4"))

            KH.RegisterKeys()
            SendModEvent("GPP_ComboKeysUpdated")
			
			bBusy = false
		endIf
		
		jValue.zeroLifetime(jMCMPreset)
	endIf
endFunction

function deletePreset(string presetName)
	JContainers.removeFileAtPath(MCMSettingsPath + presetName + FileExt)
endFunction

string[] function getPresets(string defFill)
	int jObj = JValue.readFromDirectory(MCMSettingsPath, FileExt)
	int i
	string[] tmpStrArr = jMap.allKeysPArray(jObj)
	string[] saPresets = CreateStringArray(tmpStrArr.length + 1, defFill)
	jValue.zeroLifetime(jObj)
	
	while(i < tmpStrArr.length)
		saPresets[i + 1] = Substring(tmpStrArr[i], 0, find(tmpStrArr[i], FileExt))
		i += 1
	endWhile
	
	return saPresets
endFunction

; ---------
; - Menus -
; ---------

function fillMenu(int startVal, string[] options, int defaultVal)
    SetMenuDialogStartIndex(startVal)
    SetMenuDialogOptions(options)
    SetMenuDialogDefaultIndex(defaultVal)
endFunction

; -----------
; - Sliders -
; -----------

function fillSlider(float startVal, float startRange, float endRange, float intervalVal, float defaultVal)
    SetSliderDialogStartValue(startVal)
    SetSliderDialogRange(startRange, endRange)  
    SetSliderDialogInterval(intervalVal)
    SetSliderDialogDefaultValue(defaultVal)
endFunction 

; -------------------
; - Everything else -
; -------------------

string[] function cutStrArray(string[] stringArray, int cutIndex)
	if stringArray.length < 2
		return stringArray
	endIf

	string[] newStringArray = CreateStringArray(stringArray.length - 1)
	int oldAIndex
	int newAIndex
		
	while oldAIndex < stringArray.length && newAIndex < stringArray.length - 1
		if oldAIndex != cutIndex
			newStringArray[newAIndex] = stringArray[oldAIndex]
			newAIndex += 1
		endIf
			
		oldAIndex += 1
	endWhile
	
	return newStringArray
endFunction
