Scriptname gpp_mcm_act extends gpp_mcm_page

int mcmUnmapFLAG

string[] asDescriptions

; #############
; ### SETUP ###

function initData()                  ; Initialize page specific data
	mcmUnmapFLAG = MCM.OPTION_FLAG_WITH_UNMAP
    asDescriptions = new string[16]
endFunction

int function saveData()             ; Save page data and return jObject
	int jPageObj = jArray.object()

    jArray.addInt(jPageObj, KH.aiNonComboActions[1])
    jArray.addStr(jPageObj, asDescriptions[1])
	jArray.addInt(jPageObj, KH.aiNonComboActions[2])
    jArray.addStr(jPageObj, asDescriptions[2])
	jArray.addInt(jPageObj, KH.aiNonComboActions[3])
    jArray.addStr(jPageObj, asDescriptions[3])
	jArray.addInt(jPageObj, KH.aiNonComboActions[0])
    jArray.addStr(jPageObj, asDescriptions[0])

    jArray.addInt(jPageObj, KH.aiNonComboActions[5])
    jArray.addStr(jPageObj, asDescriptions[5])
    jArray.addInt(jPageObj, KH.aiNonComboActions[6])
    jArray.addStr(jPageObj, asDescriptions[6])
    jArray.addInt(jPageObj, KH.aiNonComboActions[7])
    jArray.addStr(jPageObj, asDescriptions[7])
    jArray.addInt(jPageObj, KH.aiNonComboActions[4])
    jArray.addStr(jPageObj, asDescriptions[4])

    jArray.addInt(jPageObj, KH.aiNonComboActions[9])
    jArray.addStr(jPageObj, asDescriptions[9])
    jArray.addInt(jPageObj, KH.aiNonComboActions[10])
    jArray.addStr(jPageObj, asDescriptions[10])
    jArray.addInt(jPageObj, KH.aiNonComboActions[11])
    jArray.addStr(jPageObj, asDescriptions[11])
    jArray.addInt(jPageObj, KH.aiNonComboActions[8])
    jArray.addStr(jPageObj, asDescriptions[8])

    jArray.addInt(jPageObj, KH.aiNonComboActions[13])
    jArray.addStr(jPageObj, asDescriptions[13])
    jArray.addInt(jPageObj, KH.aiNonComboActions[14])
    jArray.addStr(jPageObj, asDescriptions[14])
    jArray.addInt(jPageObj, KH.aiNonComboActions[15])
    jArray.addStr(jPageObj, asDescriptions[15])
    jArray.addInt(jPageObj, KH.aiNonComboActions[12])
    jArray.addStr(jPageObj, asDescriptions[12])

    return jPageObj    
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj

	KH.aiNonComboActions[1] = jArray.getInt(jPageObj, 0)
    asDescriptions[1] = jArray.getStr(jPageObj, 1)
    KH.aiNonComboActions[2] = jArray.getInt(jPageObj, 2)
    asDescriptions[2] = jArray.getStr(jPageObj, 3)
    KH.aiNonComboActions[3] = jArray.getInt(jPageObj, 4)
    asDescriptions[3] = jArray.getStr(jPageObj, 5)
    KH.aiNonComboActions[0] = jArray.getInt(jPageObj, 6)
    asDescriptions[0] = jArray.getStr(jPageObj, 7)

    KH.aiNonComboActions[5] = jArray.getInt(jPageObj, 8)
    asDescriptions[5] = jArray.getStr(jPageObj, 9)
    KH.aiNonComboActions[6] = jArray.getInt(jPageObj, 10)
    asDescriptions[6] = jArray.getStr(jPageObj, 11)
    KH.aiNonComboActions[7] = jArray.getInt(jPageObj, 12)
    asDescriptions[7] = jArray.getStr(jPageObj, 13)
    KH.aiNonComboActions[4] = jArray.getInt(jPageObj, 14)
    asDescriptions[4] = jArray.getStr(jPageObj, 15)

    KH.aiNonComboActions[9] = jArray.getInt(jPageObj, 16)
    asDescriptions[9] = jArray.getStr(jPageObj, 17)
    KH.aiNonComboActions[10] = jArray.getInt(jPageObj, 18)
    asDescriptions[10] = jArray.getStr(jPageObj, 19)
    KH.aiNonComboActions[11] = jArray.getInt(jPageObj, 20)
    asDescriptions[11] = jArray.getStr(jPageObj, 21)
    KH.aiNonComboActions[8] = jArray.getInt(jPageObj, 22)
    asDescriptions[8] = jArray.getStr(jPageObj, 23)

    KH.aiNonComboActions[13] = jArray.getInt(jPageObj, 24)
    asDescriptions[13] = jArray.getStr(jPageObj, 25)
    KH.aiNonComboActions[14] = jArray.getInt(jPageObj, 26)
    asDescriptions[14] = jArray.getStr(jPageObj, 27)
    KH.aiNonComboActions[15] = jArray.getInt(jPageObj, 28)
    asDescriptions[15] = jArray.getStr(jPageObj, 29)
    KH.aiNonComboActions[12] = jArray.getInt(jPageObj, 30)
    asDescriptions[12] = jArray.getStr(jPageObj, 31)

endFunction

function drawPage()
	
	int i
    while i < 16
        if KH.aiNonComboActions[i] == -1
            asDescriptions[i] = ""
        endIf
        i += 1
    endWhile

    int keyCode = KH.GPP_KEYCODE_A1
	string tmpStr

	if keyCode > 0
	    tmpStr = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
		MCM.AddHeaderOption("$gpp_mcm_act_lbl_keyActions{" + tmpStr + "}")
		if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
			MCM.AddKeyMapOptionST("action_A1_single", "$gpp_mcm_com_lbl_single", KH.aiNonComboActions[1], mcmUnmapFLAG)
			if KH.aiNonComboActions[1] > 0
		    	MCM.AddInputOptionST("label_A1_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[1])
		    endIf
		    if KH.bExtControlsEnabled
				MCM.AddKeyMapOptionST("action_A1_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[2], mcmUnmapFLAG)
				if KH.aiNonComboActions[2] > 0
			    	MCM.AddInputOptionST("label_A1_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[2])
			    endIf
				MCM.AddKeyMapOptionST("action_A1_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[3], mcmUnmapFLAG)
				if KH.aiNonComboActions[3] > 0
			    	MCM.AddInputOptionST("label_A1_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[3])
			    endIf
				MCM.AddKeyMapOptionST("action_A1_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[0], mcmUnmapFLAG)
				if KH.aiNonComboActions[0] > 0
			    	MCM.AddInputOptionST("label_A1_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[0])
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
		    	MCM.AddInputOptionST("label_A2_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[5])
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_A2_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[6], mcmUnmapFLAG)
			    if KH.aiNonComboActions[6] > 0
			    	MCM.AddInputOptionST("label_A2_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[6])
			    endIf
			    MCM.AddKeyMapOptionST("action_A2_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[7], mcmUnmapFLAG)
			    if KH.aiNonComboActions[7] > 0
			    	MCM.AddInputOptionST("label_A2_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[7])
			    endIf
			    MCM.AddKeyMapOptionST("action_A2_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[4], mcmUnmapFLAG)
			    if KH.aiNonComboActions[4] > 0
			    	MCM.AddInputOptionST("label_A2_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[4])
			    endIf
			endIf
		else
			MCM.AddTextOptionST("act_txt_A2Conflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + tmpStr + "}", "")
			MCM.AddTextOptionST("act_txt_A2Conflict_2", "<font color='#ff7417'>$gpp_mcm_act_txt_nonCombosDsbld</font>", "")
		endIf
	else
		MCM.AddHeaderOption("<font color='#ff7417'>$gpp_mcm_com_lbl_actionRequired</font>")
		MCM.AddTextOptionST("act_txt_A2NoKey", "$gpp_mcm_com_txt_noKey1", "")
		MCM.AddTextOptionST("act_txt_A2NoKey2", "$gpp_mcm_com_txt_noKey2", "")
	endIf

    MCM.SetCursorPosition(1)

    keyCode = KH.GPP_KEYCODE_A3
	if keyCode > 0
	    tmpStr = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
	    MCM.AddHeaderOption("$gpp_mcm_act_lbl_keyActions{" + tmpStr + "}")
	    if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
		    MCM.AddKeyMapOptionST("action_A3_single", "$gpp_mcm_com_lbl_single", KH.aiNonComboActions[9], mcmUnmapFLAG)
		    if KH.aiNonComboActions[9] > 0
		    	MCM.AddInputOptionST("label_A3_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[9])
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_A3_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[10], mcmUnmapFLAG)
			    if KH.aiNonComboActions[10] > 0
			    	MCM.AddInputOptionST("label_A3_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[10])
			    endIf
			    MCM.AddKeyMapOptionST("action_A3_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[11], mcmUnmapFLAG)
			    if KH.aiNonComboActions[11] > 0
			    	MCM.AddInputOptionST("label_A3_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[11])
			    endIf
			    MCM.AddKeyMapOptionST("action_A3_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[8], mcmUnmapFLAG)
			    if KH.aiNonComboActions[8] > 0
			    	MCM.AddInputOptionST("label_A3_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[8])
			    endIf
			endIf
		else
			MCM.AddTextOptionST("act_txt_A3Conflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + tmpStr + "}", "")
			MCM.AddTextOptionST("act_txt_A3Conflict_2", "<font color='#ff7417'>$gpp_mcm_act_txt_nonCombosDsbld</font>", "")
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
		    	MCM.AddInputOptionST("label_A4_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[13])
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_A4_double", "$gpp_mcm_com_lbl_double", KH.aiNonComboActions[14], mcmUnmapFLAG)
			    if KH.aiNonComboActions[14] > 0
			    	MCM.AddInputOptionST("label_A4_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[14])
			    endIf
			    MCM.AddKeyMapOptionST("action_A4_triple", "$gpp_mcm_com_lbl_triple", KH.aiNonComboActions[15], mcmUnmapFLAG)
			    if KH.aiNonComboActions[15] > 0
			    	MCM.AddInputOptionST("label_A4_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[15])
			    endIf
			    MCM.AddKeyMapOptionST("action_A4_hold", "$gpp_mcm_com_lbl_hold", KH.aiNonComboActions[12], mcmUnmapFLAG)
			    if KH.aiNonComboActions[12] > 0
			    	MCM.AddInputOptionST("label_A4_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[12])
			    endIf
			endIf
		else
			MCM.AddTextOptionST("act_txt_A4Conflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + tmpStr + "}", "")
			MCM.AddTextOptionST("act_txt_A4Conflict_2", "<font color='#ff7417'>$gpp_mcm_act_txt_nonCombosDsbld</font>", "")
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
                asDescriptions[1] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[1])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[1] = currentStrVar
            else
                asDescriptions[1] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[1])
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
                asDescriptions[2] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[2])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[2] = currentStrVar
            else
                asDescriptions[2] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[2])
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
                asDescriptions[3] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[3])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[3] = currentStrVar
            else
                asDescriptions[3] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[3])
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
                asDescriptions[0] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[0])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[0] = currentStrVar
            else
                asDescriptions[0] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[0])
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
                asDescriptions[5] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[5])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[5] = currentStrVar
            else
                asDescriptions[5] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[5])
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
                asDescriptions[6] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[6])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[6] = currentStrVar
            else
                asDescriptions[6] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[6])
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
                asDescriptions[7] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[7])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[7] = currentStrVar
            else
                asDescriptions[7] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[7])
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
                asDescriptions[4] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[4])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[4] = currentStrVar
            else
                asDescriptions[4] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[4])
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
                asDescriptions[9] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[9])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[9] = currentStrVar
            else
                asDescriptions[9] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[9])
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
                asDescriptions[10] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[10])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[10] = currentStrVar
            else
                asDescriptions[10] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[10])
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
                asDescriptions[11] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[11])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[11] = currentStrVar
            else
                asDescriptions[11] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[11])
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
                asDescriptions[8] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[8])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[8] = currentStrVar
            else
                asDescriptions[8] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[8])
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
                asDescriptions[13] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[13])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[13] = currentStrVar
            else
                asDescriptions[13] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[13])
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
                asDescriptions[14] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[14])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[14] = currentStrVar
            else
                asDescriptions[14] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[14])
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
                asDescriptions[15] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[15])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[15] = currentStrVar
            else
                asDescriptions[15] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[15])
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
                asDescriptions[12] = ""
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
            MCM.SetInputDialogStartText(asDescriptions[12])
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                asDescriptions[12] = currentStrVar
            else
                asDescriptions[12] = ""
            endIf
            MCM.SetInputOptionValueST(asDescriptions[12])
        endIf
    endEvent
endState

