Scriptname gpp_mcm_combo_three extends gpp_mcm_page

int mcmUnmapFLAG

string sC3A1SnglLabel
string sC3A1DblLabel
string sC3A1TrplLabel
string sC3A1HldLabel

string sC3A2SnglLabel
string sC3A2DblLabel
string sC3A2TrplLabel
string sC3A2HldLabel

string sC3A3SnglLabel
string sC3A3DblLabel
string sC3A3TrplLabel
string sC3A3HldLabel

string sC3A4SnglLabel
string sC3A4DblLabel
string sC3A4TrplLabel
string sC3A4HldLabel

; #############
; ### SETUP ###

function initData()                  ; Initialize page specific data
    mcmUnmapFLAG = MCM.OPTION_FLAG_WITH_UNMAP
endFunction

int function saveData()             ; sC3Ave page data and return jObject
    int jPageObj = jArray.object()

    jArray.addInt(jPageObj, KH.aiC3Actions[1])
    jArray.addStr(jPageObj, sC3A1SnglLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[2])
    jArray.addStr(jPageObj, sC3A1DblLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[3])
    jArray.addStr(jPageObj, sC3A1TrplLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[0])
    jArray.addStr(jPageObj, sC3A1HldLabel)

    jArray.addInt(jPageObj, KH.aiC3Actions[5])
    jArray.addStr(jPageObj, sC3A2SnglLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[6])
    jArray.addStr(jPageObj, sC3A2DblLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[7])
    jArray.addStr(jPageObj, sC3A2TrplLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[4])
    jArray.addStr(jPageObj, sC3A2HldLabel)

    jArray.addInt(jPageObj, KH.aiC3Actions[9])
    jArray.addStr(jPageObj, sC3A3SnglLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[10])
    jArray.addStr(jPageObj, sC3A3DblLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[11])
    jArray.addStr(jPageObj, sC3A3TrplLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[8])
    jArray.addStr(jPageObj, sC3A3HldLabel)

    jArray.addInt(jPageObj, KH.aiC3Actions[13])
    jArray.addStr(jPageObj, sC3A4SnglLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[14])
    jArray.addStr(jPageObj, sC3A4DblLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[15])
    jArray.addStr(jPageObj, sC3A4TrplLabel)
    jArray.addInt(jPageObj, KH.aiC3Actions[12])
    jArray.addStr(jPageObj, sC3A4HldLabel)

    return jPageObj    
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj

    KH.aiC3Actions[1] = jArray.getInt(jPageObj, 0)
    sC3A1SnglLabel = jArray.getStr(jPageObj, 1)
    KH.aiC3Actions[2] = jArray.getInt(jPageObj, 2)
    sC3A1DblLabel = jArray.getStr(jPageObj, 3)
    KH.aiC3Actions[3] = jArray.getInt(jPageObj, 4)
    sC3A1TrplLabel = jArray.getStr(jPageObj, 5)
    KH.aiC3Actions[0] = jArray.getInt(jPageObj, 6)
    sC3A1HldLabel = jArray.getStr(jPageObj, 7)

    KH.aiC3Actions[5] = jArray.getInt(jPageObj, 8)
    sC3A2SnglLabel = jArray.getStr(jPageObj, 9)
    KH.aiC3Actions[6] = jArray.getInt(jPageObj, 10)
    sC3A2DblLabel = jArray.getStr(jPageObj, 11)
    KH.aiC3Actions[7] = jArray.getInt(jPageObj, 12)
    sC3A2TrplLabel = jArray.getStr(jPageObj, 13)
    KH.aiC3Actions[4] = jArray.getInt(jPageObj, 14)
    sC3A2HldLabel = jArray.getStr(jPageObj, 15)

    KH.aiC3Actions[9] = jArray.getInt(jPageObj, 16)
    sC3A3SnglLabel = jArray.getStr(jPageObj, 17)
    KH.aiC3Actions[10] = jArray.getInt(jPageObj, 18)
    sC3A3DblLabel = jArray.getStr(jPageObj, 19)
    KH.aiC3Actions[11] = jArray.getInt(jPageObj, 20)
    sC3A3TrplLabel = jArray.getStr(jPageObj, 21)
    KH.aiC3Actions[8] = jArray.getInt(jPageObj, 22)
    sC3A3HldLabel = jArray.getStr(jPageObj, 23)

    KH.aiC3Actions[13] = jArray.getInt(jPageObj, 24)
    sC3A4SnglLabel = jArray.getStr(jPageObj, 25)
    KH.aiC3Actions[14] = jArray.getInt(jPageObj, 26)
    sC3A4DblLabel = jArray.getStr(jPageObj, 27)
    KH.aiC3Actions[15] = jArray.getInt(jPageObj, 28)
    sC3A4TrplLabel = jArray.getStr(jPageObj, 29)
    KH.aiC3Actions[12] = jArray.getInt(jPageObj, 30)
    sC3A4HldLabel = jArray.getStr(jPageObj, 31)

endFunction

function drawPage()

    int keyCode = KH.GPP_KEYCODE_C3
	
	if keyCode > 0

		string keyName = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
	    
	    if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
	    
		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A1)] + "}")
		    MCM.AddKeyMapOptionST("action_C3_A1_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC3Actions[1], mcmUnmapFLAG)
		    if KH.aiC3Actions[1] > 0
		    	MCM.AddInputOptionST("label_C3_A1_sngl", "$gpp_mcm_com_lbl_addLabel", sC3A1SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C3_A1_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC3Actions[2], mcmUnmapFLAG)
			    if KH.aiC3Actions[2] > 0
			    	MCM.AddInputOptionST("label_C3_A1_dbl", "$gpp_mcm_com_lbl_addLabel", sC3A1DblLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A1_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC3Actions[3], mcmUnmapFLAG)
			    if KH.aiC3Actions[3] > 0
			    	MCM.AddInputOptionST("label_C3_A1_trpl", "$gpp_mcm_com_lbl_addLabel", sC3A1TrplLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A1_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC3Actions[0], mcmUnmapFLAG)
			    if KH.aiC3Actions[0] > 0
			    	MCM.AddInputOptionST("label_C3_A1_hld", "$gpp_mcm_com_lbl_addLabel", sC3A1HldLabel)
			    endIf
			endIf

		    MCM.AddEmptyOption()
		    
		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A2)] + "}")
		    MCM.AddKeyMapOptionST("action_C3_A2_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC3Actions[5], mcmUnmapFLAG)
		    if KH.aiC3Actions[5] > 0
		    	MCM.AddInputOptionST("label_C3_A2_sngl", "$gpp_mcm_com_lbl_addLabel", sC3A2SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C3_A2_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC3Actions[6], mcmUnmapFLAG)
			    if KH.aiC3Actions[6] > 0
			    	MCM.AddInputOptionST("label_C3_A2_dbl", "$gpp_mcm_com_lbl_addLabel", sC3A2DblLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A2_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC3Actions[7], mcmUnmapFLAG)
			    if KH.aiC3Actions[7] > 0
			    	MCM.AddInputOptionST("label_C3_A2_trpl", "$gpp_mcm_com_lbl_addLabel", sC3A2TrplLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A2_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC3Actions[4], mcmUnmapFLAG)
			    if KH.aiC3Actions[4] > 0
			    	MCM.AddInputOptionST("label_C3_A2_hld", "$gpp_mcm_com_lbl_addLabel", sC3A2HldLabel)
			    endIf
			endIf

		    MCM.SetCursorPosition(1)

		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A3)] + "}")
		    MCM.AddKeyMapOptionST("action_C3_A3_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC3Actions[9], mcmUnmapFLAG)
		    if KH.aiC3Actions[9] > 0
		    	MCM.AddInputOptionST("label_C3_A3_sngl", "$gpp_mcm_com_lbl_addLabel", sC3A3SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C3_A3_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC3Actions[10], mcmUnmapFLAG)
			    if KH.aiC3Actions[10] > 0
			    	MCM.AddInputOptionST("label_C3_A3_dbl", "$gpp_mcm_com_lbl_addLabel", sC3A3DblLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A3_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC3Actions[11], mcmUnmapFLAG)
			    if KH.aiC3Actions[11] > 0
			    	MCM.AddInputOptionST("label_C3_A3_trpl", "$gpp_mcm_com_lbl_addLabel", sC3A3TrplLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A3_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC3Actions[8], mcmUnmapFLAG)
			    if KH.aiC3Actions[8] > 0
			    	MCM.AddInputOptionST("label_C3_A3_hld", "$gpp_mcm_com_lbl_addLabel", sC3A3HldLabel)
			    endIf
			endIf

		    MCM.AddEmptyOption()
		    
		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A4)] + "}")
		    MCM.AddKeyMapOptionST("action_C3_A4_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC3Actions[13], mcmUnmapFLAG)
		    if KH.aiC3Actions[13] > 0
		    	MCM.AddInputOptionST("label_C3_A4_sngl", "$gpp_mcm_com_lbl_addLabel", sC3A4SnglLabel)
		    endIf
		    if KH.bExtControlsEnabled
			    MCM.AddKeyMapOptionST("action_C3_A4_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC3Actions[14], mcmUnmapFLAG)
			    if KH.aiC3Actions[14] > 0
			    	MCM.AddInputOptionST("label_C3_A4_dbl", "$gpp_mcm_com_lbl_addLabel", sC3A4DblLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A4_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC3Actions[15], mcmUnmapFLAG)
			    if KH.aiC3Actions[15] > 0
			    	MCM.AddInputOptionST("label_C3_A4_trpl", "$gpp_mcm_com_lbl_addLabel", sC3A4TrplLabel)
			    endIf
			    MCM.AddKeyMapOptionST("action_C3_A4_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC3Actions[12], mcmUnmapFLAG)
			    if KH.aiC3Actions[12] > 0
			    	MCM.AddInputOptionST("label_C3_A4_hld", "$gpp_mcm_com_lbl_addLabel", sC3A4HldLabel)
			    endIf
			endIf

		else
			MCM.AddTextOptionST("C3_txt_iEquipConflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + keyName + "}", "")
			MCM.AddTextOptionST("C3_txt_iEquipConflict_2", "<font color='#ff7417'>$gpp_mcm_com_txt_comboActionsDisabled</font>", "")
		endIf

	else
		MCM.AddHeaderOption("<font color='#ff7417'>$gpp_mcm_com_lbl_actionRequired</font>")
		MCM.AddTextOptionST("C3_txt_C3NoKey", "$gpp_mcm_com_txt_noKey1", "")
		MCM.AddTextOptionST("C3_txt_C3NoKey2", "$gpp_mcm_com_txt_noKey2", "")
	endIf

endFunction

; -------------------------
; - C3 + A1 Combo Actions -
; -------------------------

State action_C3_A1_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[1] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[1])
            else
                KH.aiC3Actions[1] = -1
                sC3A1SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A1_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A1SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A1SnglLabel = currentStrVar
            else
                sC3A1SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A1SnglLabel)
        endIf
    endEvent
endState

State action_C3_A1_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[2] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[2])
            else
                KH.aiC3Actions[2] = -1
                sC3A1DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A1_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A1DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A1DblLabel = currentStrVar
            else
                sC3A1DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A1DblLabel)
        endIf
    endEvent
endState

State action_C3_A1_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[3] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[3])
            else
                KH.aiC3Actions[3] = -1
                sC3A1TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A1_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A1TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A1TrplLabel = currentStrVar
            else
                sC3A1TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A1TrplLabel)
        endIf
    endEvent
endState

State action_C3_A1_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[0] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[0])
            else
                KH.aiC3Actions[0] = -1
                sC3A1HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A1_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A1HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A1HldLabel = currentStrVar
            else
                sC3A1HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A1HldLabel)
        endIf
    endEvent
endState

; -------------------------
; - C3 + A2 Combo Actions -
; -------------------------

State action_C3_A2_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[5] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[5])
            else
                KH.aiC3Actions[5] = -1
                sC3A2SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A2_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A2SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A2SnglLabel = currentStrVar
            else
                sC3A2SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A2SnglLabel)
        endIf
    endEvent
endState

State action_C3_A2_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[6] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[6])
            else
                KH.aiC3Actions[6] = -1
                sC3A2DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A2_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A2DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A2DblLabel = currentStrVar
            else
                sC3A2DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A2DblLabel)
        endIf
    endEvent
endState

State action_C3_A2_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[7] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[7])
            else
                KH.aiC3Actions[7] = -1
                sC3A2TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A2_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A2TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A2TrplLabel = currentStrVar
            else
                sC3A2TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A2TrplLabel)
        endIf
    endEvent
endState

State action_C3_A2_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[4] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[4])
            else
                KH.aiC3Actions[4] = -1
                sC3A2HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A2_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A2HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A2HldLabel = currentStrVar
            else
                sC3A2HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A2HldLabel)
        endIf
    endEvent
endState

; -------------------------
; - C3 + A3 Combo Actions -
; -------------------------

State action_C3_A3_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[9] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[9])
            else
                KH.aiC3Actions[9] = -1
                sC3A3SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A3_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A3SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A3SnglLabel = currentStrVar
            else
                sC3A3SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A3SnglLabel)
        endIf
    endEvent
endState

State action_C3_A3_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[10] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[10])
            else
                KH.aiC3Actions[10] = -1
                sC3A3DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A3_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A3DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A3DblLabel = currentStrVar
            else
                sC3A3DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A3DblLabel)
        endIf
    endEvent
endState

State action_C3_A3_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[11] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[11])
            else
                KH.aiC3Actions[11] = -1
                sC3A3TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A3_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A3TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A3TrplLabel = currentStrVar
            else
                sC3A3TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A3TrplLabel)
        endIf
    endEvent
endState

State action_C3_A3_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[8] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[8])
            else
                KH.aiC3Actions[8] = -1
                sC3A3HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A3_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A3HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A3HldLabel = currentStrVar
            else
                sC3A3HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A3HldLabel)
        endIf
    endEvent
endState

; -------------------------
; - C3 + A4 Combo Actions -
; -------------------------

State action_C3_A4_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[13] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[13])
            else
                KH.aiC3Actions[13] = -1
                sC3A4SnglLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A4_sngl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A4SnglLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A4SnglLabel = currentStrVar
            else
                sC3A4SnglLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A4SnglLabel)
        endIf
    endEvent
endState

State action_C3_A4_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[14] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[14])
            else
                KH.aiC3Actions[14] = -1
                sC3A4DblLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A4_dbl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A4DblLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A4DblLabel = currentStrVar
            else
                sC3A4DblLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A4DblLabel)
        endIf
    endEvent
endState

State action_C3_A4_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[15] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[15])
            else
                KH.aiC3Actions[15] = -1
                sC3A4TrplLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A4_trpl
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A4TrplLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A4TrplLabel = currentStrVar
            else
                sC3A4TrplLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A4TrplLabel)
        endIf
    endEvent
endState

State action_C3_A4_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC3Actions[12] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC3Actions[12])
            else
                KH.aiC3Actions[12] = -1
                sC3A4HldLabel = ""
                MCM.forcePageReset()
            endIf
        endIf
    endEvent
endState

state label_C3_A4_hld
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_setLabel")
        elseIf currentEvent == "Open"
            MCM.SetInputDialogStartText(sC3A4HldLabel)
        elseIf currentEvent == "Accept" || "Default"
            if currentEvent == "Accept"
                sC3A4HldLabel = currentStrVar
            else
                sC3A4HldLabel = ""
            endIf
            MCM.SetInputOptionValueST(sC3A4HldLabel)
        endIf
    endEvent
endState

