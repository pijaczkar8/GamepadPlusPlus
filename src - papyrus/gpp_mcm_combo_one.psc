Scriptname gpp_mcm_combo_one extends gpp_mcm_page

int mcmUnmapFLAG

string[] asDescriptions

; #############
; ### SETUP ###

function initData()                  ; Initialize page specific data
    mcmUnmapFLAG = MCM.OPTION_FLAG_WITH_UNMAP
    asDescriptions = new string[16]
endFunction

int function saveData()             ; sC1Ave page data and return jObject
    int jPageObj = jArray.object()

    jArray.addInt(jPageObj, KH.aiC1Actions[1])
    jArray.addStr(jPageObj, asDescriptions[1])
    jArray.addInt(jPageObj, KH.aiC1Actions[2])
    jArray.addStr(jPageObj, asDescriptions[2])
    jArray.addInt(jPageObj, KH.aiC1Actions[3])
    jArray.addStr(jPageObj, asDescriptions[3])
    jArray.addInt(jPageObj, KH.aiC1Actions[0])
    jArray.addStr(jPageObj, asDescriptions[0])

    jArray.addInt(jPageObj, KH.aiC1Actions[5])
    jArray.addStr(jPageObj, asDescriptions[5])
    jArray.addInt(jPageObj, KH.aiC1Actions[6])
    jArray.addStr(jPageObj, asDescriptions[6])
    jArray.addInt(jPageObj, KH.aiC1Actions[7])
    jArray.addStr(jPageObj, asDescriptions[7])
    jArray.addInt(jPageObj, KH.aiC1Actions[4])
    jArray.addStr(jPageObj, asDescriptions[4])

    jArray.addInt(jPageObj, KH.aiC1Actions[9])
    jArray.addStr(jPageObj, asDescriptions[9])
    jArray.addInt(jPageObj, KH.aiC1Actions[10])
    jArray.addStr(jPageObj, asDescriptions[10])
    jArray.addInt(jPageObj, KH.aiC1Actions[11])
    jArray.addStr(jPageObj, asDescriptions[11])
    jArray.addInt(jPageObj, KH.aiC1Actions[8])
    jArray.addStr(jPageObj, asDescriptions[8])

    jArray.addInt(jPageObj, KH.aiC1Actions[13])
    jArray.addStr(jPageObj, asDescriptions[13])
    jArray.addInt(jPageObj, KH.aiC1Actions[14])
    jArray.addStr(jPageObj, asDescriptions[14])
    jArray.addInt(jPageObj, KH.aiC1Actions[15])
    jArray.addStr(jPageObj, asDescriptions[15])
    jArray.addInt(jPageObj, KH.aiC1Actions[12])
    jArray.addStr(jPageObj, asDescriptions[12])

    return jPageObj    
endFunction

function loadData(int jPageObj)     ; Load page data from jPageObj

    KH.aiC1Actions[1] = jArray.getInt(jPageObj, 0)
    asDescriptions[1] = jArray.getStr(jPageObj, 1)
    KH.aiC1Actions[2] = jArray.getInt(jPageObj, 2)
    asDescriptions[2] = jArray.getStr(jPageObj, 3)
    KH.aiC1Actions[3] = jArray.getInt(jPageObj, 4)
    asDescriptions[3] = jArray.getStr(jPageObj, 5)
    KH.aiC1Actions[0] = jArray.getInt(jPageObj, 6)
    asDescriptions[0] = jArray.getStr(jPageObj, 7)

    KH.aiC1Actions[5] = jArray.getInt(jPageObj, 8)
    asDescriptions[5] = jArray.getStr(jPageObj, 9)
    KH.aiC1Actions[6] = jArray.getInt(jPageObj, 10)
    asDescriptions[6] = jArray.getStr(jPageObj, 11)
    KH.aiC1Actions[7] = jArray.getInt(jPageObj, 12)
    asDescriptions[7] = jArray.getStr(jPageObj, 13)
    KH.aiC1Actions[4] = jArray.getInt(jPageObj, 14)
    asDescriptions[4] = jArray.getStr(jPageObj, 15)

    KH.aiC1Actions[9] = jArray.getInt(jPageObj, 16)
    asDescriptions[9] = jArray.getStr(jPageObj, 17)
    KH.aiC1Actions[10] = jArray.getInt(jPageObj, 18)
    asDescriptions[10] = jArray.getStr(jPageObj, 19)
    KH.aiC1Actions[11] = jArray.getInt(jPageObj, 20)
    asDescriptions[11] = jArray.getStr(jPageObj, 21)
    KH.aiC1Actions[8] = jArray.getInt(jPageObj, 22)
    asDescriptions[8] = jArray.getStr(jPageObj, 23)

    KH.aiC1Actions[13] = jArray.getInt(jPageObj, 24)
    asDescriptions[13] = jArray.getStr(jPageObj, 25)
    KH.aiC1Actions[14] = jArray.getInt(jPageObj, 26)
    asDescriptions[14] = jArray.getStr(jPageObj, 27)
    KH.aiC1Actions[15] = jArray.getInt(jPageObj, 28)
    asDescriptions[15] = jArray.getStr(jPageObj, 29)
    KH.aiC1Actions[12] = jArray.getInt(jPageObj, 30)
    asDescriptions[12] = jArray.getStr(jPageObj, 31)

endFunction

function drawPage()

    int i
    while i < 16
        if KH.aiC1Actions[i] == -1
            asDescriptions[i] = ""
        endIf
        i += 1
    endWhile

    int keyCode = KH.GPP_KEYCODE_C1
	
	if keyCode > 0

		string keyName = MCM.asKeyNames[MCM.aiKeyCodes.Find(keyCode)]
	    
	    if !KH.biEquipLoaded || KH.aiiEquipKeys.Find(keyCode) == -1
		    
		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A1)] + "}")
		    MCM.AddKeyMapOptionST("action_C1_A1_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC1Actions[1], mcmUnmapFLAG)
		    if KH.aiC1Actions[1] > 0
		    	MCM.AddInputOptionST("label_C1_A1_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[1])
		    endIf
		    if KH.bMultiTapEnabled
			    MCM.AddKeyMapOptionST("action_C1_A1_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC1Actions[2], mcmUnmapFLAG)
			    if KH.aiC1Actions[2] > 0
			    	MCM.AddInputOptionST("label_C1_A1_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[2])
			    endIf
			    MCM.AddKeyMapOptionST("action_C1_A1_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC1Actions[3], mcmUnmapFLAG)
			    if KH.aiC1Actions[3] > 0
			    	MCM.AddInputOptionST("label_C1_A1_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[3])
			    endIf
            endIf
            if KH.bLongPressEnabled
			    MCM.AddKeyMapOptionST("action_C1_A1_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC1Actions[0], mcmUnmapFLAG)
			    if KH.aiC1Actions[0] > 0
			    	MCM.AddInputOptionST("label_C1_A1_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[0])
			    endIf
			endIf

		    MCM.AddEmptyOption()
		    
		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A2)] + "}")
		    MCM.AddKeyMapOptionST("action_C1_A2_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC1Actions[5], mcmUnmapFLAG)
		    if KH.aiC1Actions[5] > 0
		    	MCM.AddInputOptionST("label_C1_A2_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[5])
		    endIf
		    if KH.bMultiTapEnabled
			    MCM.AddKeyMapOptionST("action_C1_A2_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC1Actions[6], mcmUnmapFLAG)
			    if KH.aiC1Actions[6] > 0
			    	MCM.AddInputOptionST("label_C1_A2_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[6])
			    endIf
			    MCM.AddKeyMapOptionST("action_C1_A2_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC1Actions[7], mcmUnmapFLAG)
			    if KH.aiC1Actions[7] > 0
			    	MCM.AddInputOptionST("label_C1_A2_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[7])
			    endIf
            endIf
            if KH.bLongPressEnabled
			    MCM.AddKeyMapOptionST("action_C1_A2_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC1Actions[4], mcmUnmapFLAG)
			    if KH.aiC1Actions[4] > 0
			    	MCM.AddInputOptionST("label_C1_A2_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[4])
			    endIf
			endIf

		    MCM.SetCursorPosition(1)

		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A3)] + "}")
		    MCM.AddKeyMapOptionST("action_C1_A3_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC1Actions[9], mcmUnmapFLAG)
		    if KH.aiC1Actions[9] > 0
		    	MCM.AddInputOptionST("label_C1_A3_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[9])
		    endIf
		    if KH.bMultiTapEnabled
			    MCM.AddKeyMapOptionST("action_C1_A3_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC1Actions[10], mcmUnmapFLAG)
			    if KH.aiC1Actions[10] > 0
			    	MCM.AddInputOptionST("label_C1_A3_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[10])
			    endIf
			    MCM.AddKeyMapOptionST("action_C1_A3_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC1Actions[11], mcmUnmapFLAG)
			    if KH.aiC1Actions[11] > 0
			    	MCM.AddInputOptionST("label_C1_A3_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[11])
			    endIf
            endIf
            if KH.bLongPressEnabled
			    MCM.AddKeyMapOptionST("action_C1_A3_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC1Actions[8], mcmUnmapFLAG)
			    if KH.aiC1Actions[8] > 0
			    	MCM.AddInputOptionST("label_C1_A3_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[8])
			    endIf
			endIf

		    MCM.AddEmptyOption()
		    
		    MCM.AddHeaderOption("$gpp_mcm_com_lbl_comboActions{" + keyName + "}{" + MCM.asKeyNames[MCM.aiKeyCodes.Find(KH.GPP_KEYCODE_A4)] + "}")
		    MCM.AddKeyMapOptionST("action_C1_A4_single", "$gpp_mcm_com_lbl_combosingle", KH.aiC1Actions[13], mcmUnmapFLAG)
		    if KH.aiC1Actions[13] > 0
		    	MCM.AddInputOptionST("label_C1_A4_sngl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[13])
		    endIf
		    if KH.bMultiTapEnabled
			    MCM.AddKeyMapOptionST("action_C1_A4_double", "$gpp_mcm_com_lbl_combodouble", KH.aiC1Actions[14], mcmUnmapFLAG)
			    if KH.aiC1Actions[14] > 0
			    	MCM.AddInputOptionST("label_C1_A4_dbl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[14])
			    endIf
			    MCM.AddKeyMapOptionST("action_C1_A4_triple", "$gpp_mcm_com_lbl_combotriple", KH.aiC1Actions[15], mcmUnmapFLAG)
			    if KH.aiC1Actions[15] > 0
			    	MCM.AddInputOptionST("label_C1_A4_trpl", "$gpp_mcm_com_lbl_addLabel", asDescriptions[15])
			    endIf
            endIf
            if KH.bLongPressEnabled
			    MCM.AddKeyMapOptionST("action_C1_A4_hold", "$gpp_mcm_com_lbl_combohold", KH.aiC1Actions[12], mcmUnmapFLAG)
			    if KH.aiC1Actions[12] > 0
			    	MCM.AddInputOptionST("label_C1_A4_hld", "$gpp_mcm_com_lbl_addLabel", asDescriptions[12])
			    endIf
			endIf

		else
			MCM.AddTextOptionST("C1_txt_iEquipConflict_1", "$gpp_mcm_com_txt_iEquipConflict{" + keyName + "}", "")
			MCM.AddTextOptionST("C1_txt_iEquipConflict_2", "<font color='#ff7417'>$gpp_mcm_com_txt_comboActionsDisabled</font>", "")
		endIf
	
	else
		MCM.AddHeaderOption("<font color='#ff7417'>$gpp_mcm_com_lbl_actionRequired</font>")
		MCM.AddTextOptionST("C1_txt_C1NoKey", "$gpp_mcm_com_txt_noKey1", "")
		MCM.AddTextOptionST("C1_txt_C1NoKey2", "$gpp_mcm_com_txt_noKey2", "")
	endIf

endFunction

; -------------------------
; - C1 + A1 Combo Actions -
; -------------------------

State action_C1_A1_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[1] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[1])
            else
                KH.aiC1Actions[1] = -1
                asDescriptions[1] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A1_sngl
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

State action_C1_A1_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[2] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[2])
            else
                KH.aiC1Actions[2] = -1
                asDescriptions[2] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A1_dbl
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

State action_C1_A1_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[3] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[3])
            else
                KH.aiC1Actions[3] = -1
                asDescriptions[3] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A1_trpl
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

State action_C1_A1_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[0] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[0])
            else
                KH.aiC1Actions[0] = -1
                asDescriptions[0] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A1_hld
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

; -------------------------
; - C1 + A2 Combo Actions -
; -------------------------

State action_C1_A2_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[5] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[5])
            else
                KH.aiC1Actions[5] = -1
                asDescriptions[5] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A2_sngl
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

State action_C1_A2_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[6] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[6])
            else
                KH.aiC1Actions[6] = -1
                asDescriptions[6] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A2_dbl
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

State action_C1_A2_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[7] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[7])
            else
                KH.aiC1Actions[7] = -1
                asDescriptions[7] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A2_trpl
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

State action_C1_A2_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[4] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[4])
            else
                KH.aiC1Actions[4] = -1
                asDescriptions[4] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A2_hld
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

; -------------------------
; - C1 + A3 Combo Actions -
; -------------------------

State action_C1_A3_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[9] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[9])
            else
                KH.aiC1Actions[9] = -1
                asDescriptions[9] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A3_sngl
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

State action_C1_A3_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[10] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[10])
            else
                KH.aiC1Actions[10] = -1
                asDescriptions[10] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A3_dbl
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

State action_C1_A3_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[11] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[11])
            else
                KH.aiC1Actions[11] = -1
                asDescriptions[11] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A3_trpl
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

State action_C1_A3_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[8] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[8])
            else
                KH.aiC1Actions[8] = -1
                asDescriptions[8] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A3_hld
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

; -------------------------
; - C1 + A4 Combo Actions -
; -------------------------

State action_C1_A4_single
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combosingle")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[13] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[13])
            else
                KH.aiC1Actions[13] = -1
                asDescriptions[13] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A4_sngl
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

State action_C1_A4_double
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combodouble")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[14] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[14])
            else
                KH.aiC1Actions[14] = -1
                asDescriptions[14] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A4_dbl
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

State action_C1_A4_triple
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combotriple")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[15] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[15])
            else
                KH.aiC1Actions[15] = -1
                asDescriptions[15] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A4_trpl
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

State action_C1_A4_hold
    event OnBeginState()
        if currentEvent == "Highlight"
            MCM.SetInfoText("$gpp_mcm_com_txt_combohold")
        elseIf currentEvent == "Change" || "Default"
            if currentEvent == "Change"
                KH.aiC1Actions[12] = currentVar as int
                MCM.SetKeyMapOptionValueST(KH.aiC1Actions[12])
            else
                KH.aiC1Actions[12] = -1
                asDescriptions[12] = ""
            endIf
            MCM.forcePageReset()
        endIf
    endEvent
endState

state label_C1_A4_hld
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

