Scriptname gpp_mcm_act extends gpp_mcm_page

int mcmUnmapFLAG

string sA1SnglLabel
string sA1DblLabel
string sA1TrplLabel
string sA1HldLabel

string sA2SnglLabel
string sA2DblLabel
string sA2TrplLabel
string sA2HldLabel

string sA3SnglLabel
string sA3DblLabel
string sA3TrplLabel
string sA3HldLabel

string sA4SnglLabel
string sA4DblLabel
string sA4TrplLabel
string sA4HldLabel

; #############
; ### SETUP ###

function initData()                  ; Initialize page specific data
	mcmUnmapFLAG = MCM.OPTION_FLAG_WITH_UNMAP
endFunction

int function saveData()             ; Save page data and return jObject
	int jPageObj = jArray.object()

    jArray.addInt(jPageObj, KH.aiNonComboActions[1])
    jArray.addStr(jPageObj, sA1SnglLabel)
	jArray.addInt(jPageObj, KH.aiNonComboActions[2])
    jArray.addStr(jPageObj, sA1DblLabel)
	jArray.addInt(jPageObj, KH.aiNonComboActions[3])
    jArray.addStr(jPageObj, sA1TrplLabel)
	jArray.addInt(jPageObj, KH.aiNonComboActions[0])
    jArray.addStr(jPageObj, sA1HldLabel)

    jArray.addInt(jPageObj, KH.aiNonComboActions[1])
    jArray.addStr(jPageObj, sA2SnglLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[2])
    jArray.addStr(jPageObj, sA2DblLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[3])
    jArray.addStr(jPageObj, sA2TrplLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[0])
    jArray.addStr(jPageObj, sA2HldLabel)

    jArray.addInt(jPageObj, KH.aiNonComboActions[1])
    jArray.addStr(jPageObj, sA3SnglLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[2])
    jArray.addStr(jPageObj, sA3DblLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[3])
    jArray.addStr(jPageObj, sA3TrplLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[0])
    jArray.addStr(jPageObj, sA3HldLabel)

    jArray.addInt(jPageObj, KH.aiNonComboActions[1])
    jArray.addStr(jPageObj, sA4SnglLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[2])
    jArray.addStr(jPageObj, sA4DblLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[3])
    jArray.addStr(jPageObj, sA4TrplLabel)
    jArray.addInt(jPageObj, KH.aiNonComboActions[0])
    jArray.addStr(jPageObj, sA4HldLabel)

    return jPageObj    
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj

	KH.aiNonComboActions[1] = jArray.getInt(jPageObj, 0)
    sA1SnglLabel = jArray.getStr(jPageObj, 1)
    KH.aiNonComboActions[2] = jArray.getInt(jPageObj, 2)
    sA1DblLabel = jArray.getStr(jPageObj, 3)
    KH.aiNonComboActions[3] = jArray.getInt(jPageObj, 4)
    sA1TrplLabel = jArray.getStr(jPageObj, 5)
    KH.aiNonComboActions[0] = jArray.getInt(jPageObj, 6)
    sA1HldLabel = jArray.getStr(jPageObj, 7)

    KH.aiNonComboActions[1] = jArray.getInt(jPageObj, 8)
    sA2SnglLabel = jArray.getStr(jPageObj, 9)
    KH.aiNonComboActions[2] = jArray.getInt(jPageObj, 10)
    sA2DblLabel = jArray.getStr(jPageObj, 11)
    KH.aiNonComboActions[3] = jArray.getInt(jPageObj, 12)
    sA2TrplLabel = jArray.getStr(jPageObj, 13)
    KH.aiNonComboActions[0] = jArray.getInt(jPageObj, 14)
    sA2HldLabel = jArray.getStr(jPageObj, 15)

    KH.aiNonComboActions[1] = jArray.getInt(jPageObj, 16)
    sA3SnglLabel = jArray.getStr(jPageObj, 17)
    KH.aiNonComboActions[2] = jArray.getInt(jPageObj, 18)
    sA3DblLabel = jArray.getStr(jPageObj, 19)
    KH.aiNonComboActions[3] = jArray.getInt(jPageObj, 20)
    sA3TrplLabel = jArray.getStr(jPageObj, 21)
    KH.aiNonComboActions[0] = jArray.getInt(jPageObj, 22)
    sA3HldLabel = jArray.getStr(jPageObj, 23)

    KH.aiNonComboActions[1] = jArray.getInt(jPageObj, 24)
    sA4SnglLabel = jArray.getStr(jPageObj, 25)
    KH.aiNonComboActions[2] = jArray.getInt(jPageObj, 26)
    sA4DblLabel = jArray.getStr(jPageObj, 27)
    KH.aiNonComboActions[3] = jArray.getInt(jPageObj, 28)
    sA4TrplLabel = jArray.getStr(jPageObj, 29)
    KH.aiNonComboActions[0] = jArray.getInt(jPageObj, 30)
    sA4HldLabel = jArray.getStr(jPageObj, 31)

endFunction

function drawPage()
	
	int keyCode = KH.GPP_KEYCODE_A1
	string tmpStr

	if keyCode > 0
	    tmpStr = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
		MCM.AddHeaderOption("$gpp_mcm_act_lbl_keyActions{" + tmpStr + "}")
		if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
			MCM.AddKeyMapOptionST("action_A1_single", "$gpp_mcm_com_lbl_single", KH.aiNonComboActions[1], mcmUnmapFLAG)
			if KH.aiNonComboActions[1] > 0
		    	MCM.AddInputOptionST("label_A1_sngl", "$gpp_mcm_com_lbl_addLabel", sA1SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
				MCM.AddKeyMapOptionST("action_A1_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[2], mcmUnmapFLAG)
				if KH.aiNonComboActions[2] > 0
			    	MCM.AddInputOptionST("label_A1_dbl", "$gpp_mcm_com_lbl_addLabel", sA1DblLabel)
			    endIf
				MCM.AddKeyMapOptionST("action_A1_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[3], mcmUnmapFLAG)
				if KH.aiNonComboActions[3] > 0
			    	MCM.AddInputOptionST("label_A1_trpl", "$gpp_mcm_com_lbl_addLabel", sA1TrplLabel)
			    endIf
				MCM.AddKeyMapOptionST("action_A1_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[0], mcmUnmapFLAG)
				if KH.aiNonComboActions[0] > 0
			    	MCM.AddInputOptionST("label_A1_hld", "$gpp_mcm_com_lbl_addLabel", sA1HldLabel)
			    endIf
			endIf
		else
			MCM.AddTextOptionST("act_txt_A1Conflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + tmpStr + "}", "")
			MCM.AddTextOptionST("act_txt_A1Conflict_2", "<font color='#ff7417'>$gpp_mcm_act_txt_nonCombosDsbld</font>", "")
		endIf
	else
		MCM.AddHeaderOption("<font color='#ff7417'>$gpp_mcm_com_lbl_actionRequired</font>")
		MCM.AddTextOptionST("act_txt_A1NoKey", "$gpp_mcm_com_txt_noKey1", "")
		MCM.AddTextOptionST("act_txt_A1NoKey2", "$gpp_mcm_com_txt_noKey2", "")
	endIf

	MCM.AddEmptyOption()
	
    keyCode = KH.GPP_KEYCODE_A2
	if keyCode > 0
	    tmpStr = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
	    MCM.AddHeaderOption("$gpp_mcm_act_lbl_keyActions{" + tmpStr + "}")
	    if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
		    MCM.AddKeyMapOptionST("action_A2_single", "$gpp_mcm_com_lbl_single", KH.aiNonComboActions[5], mcmUnmapFLAG)
		    if KH.aiNonComboActions[5] > 0
		    	MCM.AddInputOptionST("label_A2_sngl", "$gpp_mcm_com_lbl_addLabel", sA2SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_A2_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[6], mcmUnmapFLAG)
			    if KH.aiNonComboActions[6] > 0
			    	MCM.AddInputOptionST("label_A2_dbl", "$gpp_mcm_com_lbl_addLabel", sA2DblLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_A2_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[7], mcmUnmapFLAG)
			    if KH.aiNonComboActions[7] > 0
			    	MCM.AddInputOptionST("label_A2_trpl", "$gpp_mcm_com_lbl_addLabel", sA2TrplLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_A2_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[4], mcmUnmapFLAG)
			    if KH.aiNonComboActions[4] > 0
			    	MCM.AddInputOptionST("label_A2_hld", "$gpp_mcm_com_lbl_addLabel", sA2HldLabel)
			    endIf
			endIf
		else
			MCM.AddTextOptionST("act_txt_A2Conflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + tmpStr + "}", "")
			MCM.AddTextOptionST("act_txt_A2Conflict_2", "<font color='#ff7417'>$gpp_mcm_act_lbl_nonCombosDsbld</font>", "")
		endIf
	else
		MCM.AddHeaderOption("<font color='#ff7417'>$gpp_mcm_com_lbl_actionRequired</font>")
		MCM.AddTextOptionST("act_txt_A2NoKey", "$gpp_mcm_com_txt_noKey1", "")
		MCM.AddTextOptionST("act_txt_A2NoKey2", "$gpp_mcm_com_txt_noKey2", "")
	endIf

    MCM.SetCursorPosition(1)

    keyCode = KH.GPP_KEYCODE_A2
	if keyCode > 0
	    tmpStr = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
	    MCM.AddHeaderOption("$gpp_mcm_act_lbl_keyActions{" + tmpStr + "}")
	    if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
		    MCM.AddKeyMapOptionST("action_A3_single", "$gpp_mcm_com_lbl_single", KH.aiNonComboActions[9], mcmUnmapFLAG)
		    if KH.aiNonComboActions[9] > 0
		    	MCM.AddInputOptionST("label_A3_sngl", "$gpp_mcm_com_lbl_addLabel", sA3SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_A3_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[10], mcmUnmapFLAG)
			    if KH.aiNonComboActions[10] > 0
			    	MCM.AddInputOptionST("label_A3_dbl", "$gpp_mcm_com_lbl_addLabel", sA3DblLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_A3_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[11], mcmUnmapFLAG)
			    if KH.aiNonComboActions[11] > 0
			    	MCM.AddInputOptionST("label_A3_trpl", "$gpp_mcm_com_lbl_addLabel", sA3TrplLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_A3_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[8], mcmUnmapFLAG)
			    if KH.aiNonComboActions[8] > 0
			    	MCM.AddInputOptionST("label_A3_hld", "$gpp_mcm_com_lbl_addLabel", sA3HldLabel)
			    endIf
			endIf
		else
			MCM.AddTextOptionST("act_txt_A3Conflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + tmpStr + "}", "")
			MCM.AddTextOptionST("act_txt_A3Conflict_2", "<font color='#ff7417'>$gpp_mcm_act_lbl_nonCombosDsbld</font>", "")
		endIf
	else
		MCM.AddHeaderOption("<font color='#ff7417'>$gpp_mcm_com_lbl_actionRequired</font>")
		MCM.AddTextOptionST("act_txt_A3NoKey", "$gpp_mcm_com_txt_noKey1", "")
		MCM.AddTextOptionST("act_txt_A3NoKey2", "$gpp_mcm_com_txt_noKey2", "")
	endIf

    MCM.AddEmptyOption()
    
    keyCode = KH.GPP_KEYCODE_A4
	if keyCode > 0
	    tmpStr = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
	    MCM.AddHeaderOption("$gpp_mcm_act_lbl_keyActions{" + tmpStr + "}")
	    if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
		    MCM.AddKeyMapOptionST("action_A4_single", "$gpp_mcm_com_lbl_single", KH.aiNonComboActions[13], mcmUnmapFLAG)
		    if KH.aiNonComboActions[13] > 0
		    	MCM.AddInputOptionST("label_A4_sngl", "$gpp_mcm_com_lbl_addLabel", sA4SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_A4_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[14], mcmUnmapFLAG)
			    if KH.aiNonComboActions[14] > 0
			    	MCM.AddInputOptionST("label_A4_dbl", "$gpp_mcm_com_lbl_addLabel", sA4DblLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_A4_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[15], mcmUnmapFLAG)
			    if KH.aiNonComboActions[15] > 0
			    	MCM.AddInputOptionST("label_A4_trpl", "$gpp_mcm_com_lbl_addLabel", sA4TrplLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_A4_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[12], mcmUnmapFLAG)
			    if KH.aiNonComboActions[12] > 0
			    	MCM.AddInputOptionST("label_A4_hld", "$gpp_mcm_com_lbl_addLabel", sA4HldLabel)
			    endIf
			endIf
		else
			MCM.AddTextOptionST("act_txt_A4Conflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + tmpStr + "}", "")
			MCM.AddTextOptionST("act_txt_A4Conflict_2", "<font color='#ff7417'>$gpp_mcm_act_lbl_nonCombosDsbld</font>", "")
		endIf
	else
		MCM.AddHeaderOption("<font color='#ff7417'>$gpp_mcm_com_lbl_actionRequired</font>")
		MCM.AddTextOptionST("act_txt_A4NoKey", "$gpp_mcm_com_txt_noKey1", "")
		MCM.AddTextOptionST("act_txt_A4NoKey2", "$gpp_mcm_com_txt_noKey2", "")
	endIf

endFunction

; ---------------------------------
; - A1 Non-Combo Keypress Actions -
; ---------------------------------

State action_A1_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actSgl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[1] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[1])
            else
                KH.aiNonComboActions[1] = -1
                sA1SnglLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A1_sngl
	event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA1SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA1SnglLabel = currentStrVar
            else
                sA1SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA1SnglLabel)
        endIf
    endEvent
endState

State action_A1_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actDbl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[2] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[2])
            else
                KH.aiNonComboActions[2] = -1
                sA1DblLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A1_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA1DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA1DblLabel = currentStrVar
            else
                sA1DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA1DblLabel)
        endIf
    endEvent
endState

State action_A1_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actTrpl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[3] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[3])
            else
                KH.aiNonComboActions[3] = -1
                sA1TrplLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A1_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA1TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA1TrplLabel = currentStrVar
            else
                sA1TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA1TrplLabel)
        endIf
    endEvent
endState

State action_A1_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actHld")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[0] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[0])
            else
                KH.aiNonComboActions[0] = -1
                sA1HldLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A1_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA1HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA1HldLabel = currentStrVar
            else
                sA1HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA1HldLabel)
        endIf
    endEvent
endState

; ---------------------------------
; - A2 Non-Combo Keypress Actions -
; ---------------------------------

State action_A2_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actSgl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[5] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[5])
            else
                KH.aiNonComboActions[5] = -1
                sA2SnglLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A2_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA2SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA2SnglLabel = currentStrVar
            else
                sA2SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA2SnglLabel)
        endIf
    endEvent
endState

State action_A2_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actDbl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[6] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[6])
            else
                KH.aiNonComboActions[6] = -1
                sA2DblLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A2_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA2DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA2DblLabel = currentStrVar
            else
                sA2DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA2DblLabel)
        endIf
    endEvent
endState

State action_A2_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actTrpl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[7] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[7])
            else
                KH.aiNonComboActions[7] = -1
                sA2TrplLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A2_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA2TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA2TrplLabel = currentStrVar
            else
                sA2TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA2TrplLabel)
        endIf
    endEvent
endState

State action_A2_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actHld")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[4] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[4])
            else
                KH.aiNonComboActions[4] = -1
                sA2HldLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A2_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA2HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA2HldLabel = currentStrVar
            else
                sA2HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA2HldLabel)
        endIf
    endEvent
endState

; ---------------------------------
; - A3 Non-Combo Keypress Actions -
; ---------------------------------

State action_A3_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actSgl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[9] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[9])
            else
                KH.aiNonComboActions[9] = -1
                sA3SnglLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A3_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA3SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA3SnglLabel = currentStrVar
            else
                sA3SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA3SnglLabel)
        endIf
    endEvent
endState

State action_A3_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actDbl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[10] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[10])
            else
                KH.aiNonComboActions[10] = -1
                sA3DblLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A3_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA3DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA3DblLabel = currentStrVar
            else
                sA3DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA3DblLabel)
        endIf
    endEvent
endState

State action_A3_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actTrpl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[11] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[11])
            else
                KH.aiNonComboActions[11] = -1
                sA3TrplLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A3_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA3TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA3TrplLabel = currentStrVar
            else
                sA3TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA3TrplLabel)
        endIf
    endEvent
endState

State action_A3_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actHld")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[8] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[8])
            else
                KH.aiNonComboActions[8] = -1
                sA3HldLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A3_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA3HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA3HldLabel = currentStrVar
            else
                sA3HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA3HldLabel)
        endIf
    endEvent
endState

; ---------------------------------
; - A4 Non-Combo Keypress Actions -
; ---------------------------------

State action_A4_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actSgl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[13] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[13])
            else
                KH.aiNonComboActions[13] = -1
                sA4SnglLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A4_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA4SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA4SnglLabel = currentStrVar
            else
                sA4SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA4SnglLabel)
        endIf
    endEvent
endState

State action_A4_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actDbl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[14] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[14])
            else
                KH.aiNonComboActions[14] = -1
                sA4DblLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A4_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA4DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA4DblLabel = currentStrVar
            else
                sA4DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA4DblLabel)
        endIf
    endEvent
endState

State action_A4_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actTrpl")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[15] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[15])
            else
                KH.aiNonComboActions[15] = -1
                sA4TrplLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A4_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA4TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA4TrplLabel = currentStrVar
            else
                sA4TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA4TrplLabel)
        endIf
    endEvent
endState

State action_A4_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_act_txt_actHld")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiNonComboActions[12] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiNonComboActions[12])
            else
                KH.aiNonComboActions[12] = -1
                sA4HldLabel = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_A4_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sA4HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sA4HldLabel = currentStrVar
            else
                sA4HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sA4HldLabel)
        endIf
    endEvent
endState

