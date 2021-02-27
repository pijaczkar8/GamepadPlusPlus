Scriptname gpp_mcm_inf extends gpp_mcm_page

import StringUtil

string[] saPresets
string[] modStates

; #############
; ### SETUP ###
; #############
event OnInit()
	if RegisterModule("$gpp_mcm_lbl_inf", 6) != OK
		KeepTryingToRegister()
	endif
endEvent

event OnPageInit()
	modStates = new string[2]
	modStates[0] = "$gpp_mcm_inf_lbl_notDetected"
	modStates[1] = "$gpp_mcm_inf_lbl_detected"
endevent

int function SaveData()             ; Save page data and return jObject
    return jArray.object()
endfunction

function LoadData(int jPageObj)     ; Load page data from jPageObj
endfunction

; #####################
; ### Profiles Page ###
; #####################

event OnPageDraw()
    nl_mcm MCM = UNSAFE_RAW_MCM
	int jObj = JValue.readFromDirectory(MCM.MCMSettingsPath, MCM.FileExt)

	MCM.AddHeaderOption("<font color='#C4A57A'>$gpp_mcm_inf_lbl_presets</font>")
	MCM.AddEmptyOption()
	MCM.AddInputOptionST("inf_inp_savepreset", "$gpp_mcm_inf_lbl_savepreset", "")
	if jMap.count(jObj) > 0
		MCM.AddMenuOptionST("inf_men_loadpreset", "$gpp_mcm_inf_lbl_loadpreset", "")
		MCM.AddMenuOptionST("inf_men_deletepreset", "$gpp_mcm_inf_lbl_deletepreset", "")
	endIf
	jValue.zeroLifetime(jObj)

	MCM.AddEmptyOption()
	MCM.AddTextOptionST("inf_txt_reset", "<font color='#ff7417'>$gpp_mcm_inf_lbl_reset</font>", "")

	MCM.SetCursorPosition(1)

	MCM.AddHeaderOption("<font color='#C4A57A'>$gpp_mcm_inf_lbl_info</font>")
	MCM.AddEmptyOption()
	MCM.AddTextOptionST("inf_txt_iequip", "$gpp_mcm_inf_lbl_iequip", modStates[(Game.GetModByName("iEquip.esp") != 255) as int])
endevent

; ------------
; - Profiles -
; ------------

State inf_inp_savepreset
    event OnHighlightST()
        SetInfoText("$gpp_mcm_inf_txt_savepreset")
    endevent

	event OnInputOpenST()
		SetInputDialogStartText("$gpp_mcm_inf_lbl_PresetName")
    endevent

	event OnInputAcceptST(string input)
		SaveMCMToPreset(input)
	endevent
endState

State inf_men_loadpreset
    event OnHighlightST()
        SetInfoText("$gpp_mcm_inf_txt_loadpreset")
    endevent

	event OnMenuOpenST()
		GetMCMSavedPresets(saPresets, "$gpp_mcm_inf_lbl_noLoad")
		SetMenuDialog(saPresets, 0)
    endevent

	event OnMenuAcceptST(int index)
		if index > 0
			LoadMCMFromPreset(saPresets[index])
			ForcePageReset()
		endif
	endevent
endState

State inf_men_deletepreset
    event OnHighlightST()
        SetInfoText("$gpp_mcm_inf_txt_deletepreset")
    endevent

	event OnMenuOpenST()
		GetMCMSavedPresets(saPresets, "$gpp_mcm_inf_lbl_noDelete")
		SetMenuDialog(saPresets, 0)
    endevent

	event OnMenuAcceptST(int index)
		if index > 0
			DeleteMCMSavedPreset(saPresets[index])
		endif
	endevent
endState

State inf_txt_reset
    event OnHighlightST()
        SetInfoText("$gpp_mcm_inf_txt_reset")
    endevent

	event OnSelectST()
		if ShowMessage("$gpp_mcm_inf_msg_reset", true, "$gpp_mcm_inf_btn_reset", "$gpp_mcm_inf_btn_cancel")
			LoadMCMFromPreset("gpp_default_doNotDelete.gppd", true)
			ForcePageReset()
		endif
    endevent
endState