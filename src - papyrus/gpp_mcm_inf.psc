Scriptname gpp_mcm_inf extends gpp_mcm_page

import StringUtil

string[] saPresets
string[] modStates

; #############
; ### SETUP ###
; #############

function initData()                  ; Initialize page specific data
	modStates = new string[2]
	modStates[0] = "$gpp_mcm_inf_lbl_notDetected"
	modStates[1] = "$gpp_mcm_inf_lbl_detected"
endFunction

int function saveData()             ; Save page data and return jObject
    return jArray.object()
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj
endFunction

; #####################
; ### Profiles Page ###
; #####################

function drawPage()
	int jObj = JValue.readFromDirectory(MCM.MCMSettingsPath, MCM.FileExt)

	MCM.AddHeaderOption("<font color='#C4A57A'>$gpp_mcm_inf_lbl_presets</font>")
	MCM.AddEmptyOption()
	MCM.AddInputOptionST("inf_inp_savepreset", "$gpp_mcm_inf_lbl_savepreset", "")
	if jMap.count(jObj) > 0
		MCM.AddEmptyOption()
		MCM.AddMenuOptionST("inf_men_loadpreset", "$gpp_mcm_inf_lbl_loadpreset", "")
		MCM.AddEmptyOption()
		MCM.AddMenuOptionST("inf_men_deletepreset", "$gpp_mcm_inf_lbl_deletepreset", "")
	endIf
	jValue.zeroLifetime(jObj)

	MCM.AddEmptyOption()
	MCM.AddTextOptionST("inf_txt_reset", "<font color='#ff7417'>$gpp_mcm_inf_lbl_reset</font>", "")

	MCM.SetCursorPosition(1)

	MCM.AddHeaderOption("<font color='#C4A57A'>$gpp_mcm_inf_lbl_info</font>")
	MCM.AddEmptyOption()
	MCM.AddTextOptionST("inf_txt_iequip", "$gpp_mcm_inf_lbl_iequip", modStates[(Game.GetModByName("iEquip.esp") != 255) as int])

endFunction

; ------------
; - Profiles -
; ------------

State inf_inp_savepreset
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_inf_txt_savepreset")
        elseIf currentEvent == "Open"
			MCM.SetInputDialogStartText("$gpp_mcm_inf_lbl_PresetName")
        elseIf currentEvent == "Accept"
			MCM.savePreset(currentStrVar)
			MCM.ForcePageReset()
        endIf 
    endEvent
endState

State inf_men_loadpreset
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_inf_txt_loadpreset")
        elseIf currentEvent == "Open"
			saPresets = MCM.getPresets("$gpp_mcm_inf_lbl_noLoad")
			MCM.fillMenu(0, saPresets, 0)
        elseIf currentEvent == "Accept"
			if (currentVar as int > 0)
				MCM.loadPreset(saPresets[currentVar as int])
			endIf
        endIf 
    endEvent
endState

State inf_men_deletepreset
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_inf_txt_deletepreset")
        elseIf currentEvent == "Open"
			saPresets = MCM.getPresets("$gpp_mcm_inf_lbl_noDelete")
			MCM.fillMenu(0, saPresets, 0)
        elseIf currentEvent == "Accept"
			if (currentVar as int > 0)
				MCM.deletePreset(saPresets[currentVar as int])
				MCM.ForcePageReset()
			endIf
        endIf 
    endEvent
endState

State inf_txt_reset
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_inf_txt_reset")
        elseIf currentEvent == "Select" && MCM.ShowMessage("$gpp_mcm_inf_msg_reset", true, "$gpp_mcm_inf_btn_reset", "$gpp_mcm_inf_btn_cancel")
        	MCM.loadPreset("gpp_default_doNotDelete", true)
        endIf
    endEvent    
endState